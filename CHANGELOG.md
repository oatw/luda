# 0.3.2 (December 9, 2019)

## Fixed

- Fixed [#20](https://github.com/oatw/luda/issues/20).

- Fixed [#21](https://github.com/oatw/luda/issues/21).

## Deprecated

- Dropped support for safari 10.

# 0.3.1 (December 6, 2019)

## Changed

- The key `dom` in component watch helper respond object was replaced by `node`.

## Added

- Added the `arrayEqual` static function.

- Added multiple attribute names support in component watch helper.

- Added `luda:fmSelect:changed`, `luda:fmFile:changed`, `luda:fmDropdown:changed` events.

## Fixed

- Fixed [#19](https://github.com/oatw/luda/issues/19) - Nested carousel pause and play bug.

# 0.3.0 (November 19, 2019)

## Changed

- Theme sass variable files were moved into each theme's directory.

- The javascripts were totally rewritten, all js APIs were changed.

- The `data-enter-disabled` attribute was replaced by the `data-enter="false"` attribute in the enter behavior.

- The `data-focus-disabled` attribute was replaced by the `data-focus="false"` attribute in the focus behavior.

- The `data-tabulate-disabled` attribute was replaced by the `data-tabulate="false"` attribute in the tabulate behavior.

- The `data-readonly` attribute was replaced by the `readonly` attribute, as the readonly behavior's selector.

- The `data-toggle` and `data-toggle-disabled` attributes were reaplced by the `data-toggleable` attribute in the toggle behavior.

- The `data-dropdown-toggle` and `data-dropdown-toggle-disabled` attributes were replaced by the `data-dropdownable` attribute in the dropdown pattern.

- `.btn-radio` buttons in the tab pattern were replaced by `.btn` buttons. 

## Added

- The kernel functions were added for a better experience of writting components.

- Custom firefox scrollbar styles were added.

# 0.2.0 (May 30, 2019)

## Changed

- Body copy font size was changed to `16px`, font sizes in components were changed.

- Baseline height was changed to `12px`, component sizes and typography line heights were changed.

- Paragraph classes were changed to `.p5`, '`.p6`', `.p7` and `.p8`.

- Dark color and muted color were changed for better readability.

- Many Sass variables were changed.

## Added

- Added typography size level 7 and 8.

- Added CSS variables.

- Added sass function `baseline($count: 1)` for replacing sass variable `$spacing-base-rem`.

- Added the article pattern.

## Deprecated

- `.badge-baseline` were removed and replaced by `.badge`.

- Some sass variables were removed.

# 0.1.13 (May 05, 2019)

- Initial release.