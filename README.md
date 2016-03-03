[![Circle CI](https://circleci.com/gh/pbrisbin/codeclimate-gnu-complexity.svg?style=svg)](https://circleci.com/gh/pbrisbin/codeclimate-gnu-complexity) [![Code Climate](https://codeclimate.com/github/pbrisbin/codeclimate-gnu-complexity/badges/gpa.svg)](https://codeclimate.com/github/pbrisbin/codeclimate-gnu-complexity)

Code Climate Engine to run [GNU Complexity][]

[GNU Complexity]: https://www.gnu.org/software/complexity/manual/complexity.html

## Installation

```
git clone https://github.com/pbrisbin/codeclimate-gnu-complexity
cd codeclimate-gnu-complexity
make image
```

## Usage

**.codeclimate.yml**

```yml
engines:
  gnu-complexity:
    enabled: true
```

```
codeclimate analyze --dev
```
