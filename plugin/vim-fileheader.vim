let g:javascript_delimiter_map = { 'begin': '/**', 'char': ' * ', 'end': ' */' }
let g:fileheader_delimiter_map = {
\ 'javascript': javascript_delimiter_map,
\ 'javascriptreact': javascript_delimiter_map,
\ 'typescript': javascript_delimiter_map,
\ 'typescriptreact': javascript_delimiter_map,
\ }

let g:javascript_templates_map = [
\ '@file {TODO}',
\ '@author {{author}}<{{email}}>',
\ ]
let g:fileheader_templates_map = {
\ 'javascript': javascript_templates_map,
\ 'javascriptreact': javascript_templates_map,
\ 'typescript': javascript_templates_map,
\ 'typescriptreact': javascript_templates_map,
\ }