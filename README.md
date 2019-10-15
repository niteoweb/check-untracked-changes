# Check Un-tracked Changes Orb
[![CircleCI](https://circleci.com/gh/niteoweb/check-untracked-changes/tree/master.svg?style=svg&circle-token=2a9cb57945337d7999f3f325ffdd0569795157bf)](https://circleci.com/gh/niteoweb/check-untracked-changes/tree/master)

An orb to test if any un-tracked changes(to git commit) are present in the given path.
This is useful to test if any auto-formatters(like black, codegen) have produced changes during CI validation. 


## Example Usage
```yml
version: 2.1

orbs:
  untracked_changes: niteo/check-untracked-changes@1.0.0
jobs:
  test:
      docker:
        - image: circleci/python:3.7  # Can be any executor
      steps:
        - checkout
        
        # Run auto-formatter commands
        - run: pip install black
        - run: black src/

        # Fail if changes are produced
        - untracked_changes/check:
            path: "src/"

workflows:
  test-format:
      jobs:
        - test
```


## Development

* To see all the existing orbs in the organization, run:
```bash
$ circleci orb list niteo
```

* To validate the orb, run:
```bash
$ make validate
```

* You can publish a **dev** version of the orb for testing before publishing a production immutable version. To publish a dev version of 1.0.1, run:
```bash
$ make dev-release tag=1.0.1
```

> Note: It is always a good practice to test a dev version of the orb first before publishing new public version.


## Publishing Orb

* Make sure you have privileges to publish the orb to production.
* Once the dev version is tested, You can publish a new orb version manually, by specifying new version:
```bash
$ make prod-release tag=1.0.1
```
> Note: Once the new version of orb is published, the same can be tagged in the Github releases.


## Additional Information
Authoring orb: https://circleci.com/docs/2.0/orb-author/
