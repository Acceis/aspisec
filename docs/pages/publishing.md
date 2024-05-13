# Publishing

Check the **linter**:

```
$ bundle exec rubocop -a
```

Update the version in `lib-ruby/aspisec/version.rb`.

Update the documentation, at least:

- `README.md`
- `docs/CHANGELOG.md`
- `docs/pages/usage.md`

On new release don't forget to rebuild the **library documentation**:

```
$ bundle exec yard doc
```

Create an **annotated git tag**:

```
$ git tag -a v1.5.0
```

Push the changes including the tags:

```
$ git push --follow-tags
```

Build the **gem**:

```
$ gem build aspisec.gemspec
```

Push the new gem release on **RubyGems** See https://guides.rubygems.org/publishing/.

```
$ gem push aspisec-1.5.0.gem
```
