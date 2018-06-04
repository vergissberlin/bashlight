
# Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## Testing

```
bash tests/functional/suite.bash
bats ./tests/acceptance/
```

## CI

```
fly set-pipeline \
	-t box \
	-p bashlight \
	-c ci/pipeline.yml \
	-l ci/variables/messages.yml \
	-l ci/variables/credentials.yml -n
```


## Change log

Update the changelog
```
conventional-changelog -i CHANGELOG.md -s -r 0
```
