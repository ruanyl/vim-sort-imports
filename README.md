vim-sort-import
----------

Please refer to [import-sort](https://github.com/renke/import-sort) for more details

Config example:
```
// enable auto sort import on write
let g:fixmyjs_sort_auto = 1

// install import-sort packages
npm install --save-dev import-sort-cli import-sort-parser-babylon import-sort-parser-typescript import-sort-style-renke

// package.json:
"importSort": {
  ".js, .jsx, .es6, .es": {
    "parser": "babylon",
    "style": "renke"
  },
  ".ts, .tsx": {
    "parser": "typescript",
    "style": "renke"
  }
}
```

### Available CMD
```
// run import-sort against current buffer
:SortImport

// start run import-sort on save
:StartAutoSortImport

// stop run import-sort on save
:StopAutoSortImport
```
