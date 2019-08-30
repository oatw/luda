# 0.3.0 (November 19, 2019)

## Changed

- Theme sass variable files are moved into each theme's directory.

- The javascripts are totally rewritten, all js APIs are changed.

- The `data-enter-disabled` attribute is replaced by the `data-enter="false"` attribute in the enter behavior.

- The `data-focus-disabled` attribute is replaced by the `data-focus="false"` attribute in the focus behavior.

- The `data-tabulate-disabled` attribute is replaced by the `data-tabulate="false"` attribute in the tabulate behavior.

- The `data-readonly` attribute is replaced by the `readonly` attribute, as the readonly behavior's selector.

- The `data-toggle` and `data-toggle-disabled` attributes are reaplced by the `data-toggleable` attribute in the toggle behavior.

- The `data-dropdown-toggle` and `data-dropdown-toggle-disabled` attributes are replaced by the `data-dropdownable` attribute in the dropdown pattern.

- `.btn-radio` buttons in the tab pattern are replaced by `.btn` buttons. 

## Added

- The kernel functions are added for a better experience of writting components.

## Deprecated

- Modular import support is removed from the Luda gem since Rails added webpacker from version 6.0.

# 0.2.0 (May 30, 2019)

## Changed

- Body copy font size is changed to `16px`, font sizes in components are changed.

- Baseline height is changed to `12px`, component sizes and typography line heights are changed.

- Paragraph classes are changed to `.p5`, '`.p6`', `.p7` and `.p8`.

- Dark color and muted color are changed for better readability.

- Many Sass variables are changed.

## Added

- Add typography size level 7 and 8.

- Add CSS variables.

- Add sass function `baseline($count: 1)` for replacing sass variable `$spacing-base-rem`.

- Add the article pattern.

## Deprecated

- `.badge-baseline` is removed and replaced by `.badge`.

- Some sass variables are removed.

# 0.1.13 (May 05, 2019)

- Initial release.