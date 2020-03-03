+++
title = "Python Memory Usage"
description = "Exploring the memory footprint of different python data representations."
category = "Data"
tags = ["python"]
date = 2020-03-03
draft = true
+++


Recently my colleague and I were using Python to process several GB worth of
CSV data. We realised this dataset was big enough to be mindful of the overall
memory usage of our program and there decided to spend some time measuring the
efficiency of the various different data representations available.

We considered representing each data item using a:

- Dictionary
- Named Tuple
- Data Class
- Class
- Data Class / Class with slots


### Dictionary

Very flexible, lacks any explicit expectations around what fields each data
type should contain.


```python
# Dictionary

fruit_as_dict = dict(name='mango', price=123, colour='red')
```

### Named Tuple

No frills, lightweight, clearly defines field names. A staple of the standard
library since Python 2.6.

```python
# Named Tuple

import collections

TupleFruit = collections.namedtuple('TupleFruit', ['name', 'price', 'colour'])

fruit_as_named_tuple = TupleFruit('mango', 123, 'red')
```

### Typed Named Tuple

Named tuple + types. PEP 526 variable annotation syntax makes the type of each
field clear.

```python
# Typed Named Tuple

import typing

class TypedTupleFruit(typing.NamedTuple):
    name: str
    price: int
    colour: str

fruit_as_named_typed_tuple = TypedTupleFruit('mango', 123, 'red')
```

### Data Class

As with the typed named tuple, a data class very clearly lays out the name and
type of each field. It has quite a rich [API][1] with useful functions for
converting it to a tuple or a dict.

```python
# Data Class

from dataclasses import dataclass

@dataclass
class DataClassFruit:
    name: str
    price: int
    colour: str

fruit_as_dataclass = DataClassFruit('mango', 123, 'red')
```

### Data Class (Slots)

All the advantages of a data class, but consuming less memory by storing value
references in slots instead of `__dict__`.

```python
# Slot Data Class

from dataclasses import dataclass

@dataclass
class SlotDataClassFruit:
    __slots__ = [ 'name', 'price', 'colour' ]
    name: str
    price: int
    colour: str

fruit_as_slot_dataclass = SlotDataClassFruit('mango', 123, 'red')
```

### Class

Fully customisable, but potentially requires lots of boilerplate to bring it up
to feature parity with a data class.

```python
# Class

class ClassFruit(object):
    def __init__(self, name, price, colour):
        self.name = name
        self.price = price
        self.colour = colour

fruit_as_class = ClassFruit('mango', 123, 'red')
```

### Class (Slots)

Again, we can use slots to reduce memory consumption.

```python
# Slot Class

class SlotClassFruit(object):
    __slots__ = ('name', 'price', 'colour')
    def __init__(self, name, price, colour):
        self.name = name
        self.price = price
        self.colour = colour

fruit_as_slotclass = SlotClassFruit('mango', 123, 'red')
```

### Measuring Size

Calling `sys.getsizeof` with any given object will return its size. However,
only memory directly used by the object is returned, not the memory usage of
objects it refers to. To solve this we can walk each objects referents, calling
`getsizeof`, until all objects have been measured. The following implementation
is specifically designed to work for our examples and therefore quite
simplistic. It does not deal with all types of object and doesn't handle
cyclical data structures.

```
import sys

def get_size(root_obj):
    size = 0
    to_explore = [root_obj]
    while len(to_explore) > 0:
        obj = to_explore.pop()
        size += sys.getsizeof(obj)
        if isinstance(obj, tuple):
            to_explore.extend(obj)
        if isinstance(obj, Mapping):
            to_explore.extend(obj.keys())
            to_explore.extend(obj.values())
        if hasattr(obj, '__dict__'):
            to_explore.append(vars(obj))
        if hasattr(obj, '__slots__'):
            to_explore.extend([getattr(obj, s) for s in obj.__slots__])
    return size
```

### Results

These results were obtained with Python 3.7.4. Full code is available [here][2].

Before looking at the size of a compound data type, its useful to know how much
memory the primitive data types alone consume.

| Data    | Size (Bytes)  |
| ------- | ------------- |
| 'mango' | 54            |
| 123     | 28            |
| 'red'   | 52            |
| total   | 134           |

We can then measure the size of each representation and calculate the overhead added by each.

| Representation        | Size (Bytes) | Overhead (Bytes) |
| --------------------- | ------------ | ---------------- |
| Data class            | 480          | 346              |
| Data class (slots)    | 206          | 72               |
| Class                 | 480          | 346              |
| Class (slots)         | 206          | 72               |
| Named tuple           | 214          | 80               |
| Typed named tuple     | 214          | 80               |
| Dictionary            | 544          | 410              |


### A bigger test: Benchmarking a million fruits

While it's informative to measure the bytes consumed by a single data item, a
more realistic benchmark would be to see how memory usage adds up as multiple
items are processed.

So instead, lets create a small script that grow a list of items and print the
sum of the `price` field.

```python
#!/usr/bin/env python3

import sys
from dataclasses import dataclass

count = int(sys.argv[1])

@dataclass
class DataClassFruit:
    name: str
    price: int
    colour: str

def fruit_as_dataclass():
    return DataClassFruit('mango', 123, 'red')

basket = [fruit_as_dataclass() for _ in range(count)]

total_price = sum((f.price for f in basket))

print(total_price)
```

We can then invoke this script using the `time` utility and measure the
the ["maximum resident set size"][3] value. This tells us the maximum
number of kilobytes of memory that was used simultaneously.

```
/usr/bin/time -l dataclass.py 1000000
123000000
        1.22 real         1.14 user         0.07 sys
 227151872  maximum resident set size
         0  average shared memory size
         0  average unshared data size
         0  average unshared stack size
     64116  page reclaims
         0  page faults
         0  swaps
         0  block input operations
         0  block output operations
         0  messages sent
         0  messages received
         0  signals received
         9  voluntary context switches
       288  involuntary context switches
```

Given a simmilar program for each of the representation, we can see how they
compare.

Here are the results for a `count` of 1000000.:

| Representation        | Max RSS (Kilobytes) |
| --------------------- | ------------------- |
| Data class            | 226988032           |
| Data class (slots)    | 113152000           |
| Class                 | 225234944           |
| Class (slots)         | 111427584           |
| Named Tuple           | 127430656           |
| Typed named tuple     | 128278528           |
| Dictionary            | 289476608           |

### Conclusion

We settled on using `typing.NamedTuple` to represent high volume data, and to
use the richer `DataClass` for the lower volume results of aggregate.

Whatever your use case, I hope the above measurements help you make an informed
choice.

### Bonus: Comparing with Pympler

To validate our findings, lets perform the same analysis using `asizeof` from
the [pympler][4] package.

| Data    | Size (Bytes)  |
| ------- | ------------- |
| 'mango' | 56            |
| 123     | 32            |
| 'red'   | 56            |
| total   | 144           |


Interestingly, pyampler reports the strings `'mango'` and `'red'` as consuming
the same memory, despite being of different lengths.

This is because by default `asize` of will return size measurements aligned to
multiples of 8. I suspect this is due to assumptions about byte aligned memory
access.

| Representation        | Size (Bytes) | Overhead (Bytes) |
| --------------------- | ------------ | ---------------- |
| Data class            | 496          | 352              |
| Data class (slots)    | 216          | 72               |
| Class                 | 496          | 352              |
| Class (slots)         | 216          | 72               |
| Named tuple           | 224          | 80               |
| Typed named tuple     | 224          | 80               |
| Dictionary            | 560          | 416              |

If we disable, then pympler returns the exact same measurements as our home
made `get_size` function.

[1]: https://docs.python.org/3/library/dataclasses.html
[2]: https://github.com/jfgreen/python-representation-sizes
[3]: https://www.gnu.org/software/libc/manual/html_node/Resource-Usage.html
[4]: https://pypi.org/project/Pympler/
