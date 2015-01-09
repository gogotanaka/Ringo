# Ringo
### Programig language by using Drums instead of Keyboard.
### Functional programming
### Turing completeness
# Demo

```
bhshbbshbbhsbhshhbshbhshbbshbbhsbhshhbshbhshbbshbbhsbhshhbshbhshbbshbbhsbhshhbsh
```
![images.jpeg](https://qiita-image-store.s3.amazonaws.com/0/30440/bf730f13-9aa5-7eac-23fc-b7bf6278682a.jpeg)

# How to install
    $ cabal install ringo

# Develope
## Build
    $ git clone git@github.com:gogotanaka/Ringo.git
    $ cd Ringo
    $ cabal sandbox init
    $ cabal install --only-dependencies
    $ cabal configure
    $ cabal build
    $ ./dist/build/ringo/ringo

# Test
    $ cabal install --enable-tests
    $ cabal tests

