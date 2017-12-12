func! import_sort#find_executable()
  let l:import_sort_executable = getcwd() . '/node_modules/.bin/import-sort'
  if !executable(l:import_sort_executable)
    let s:project_root_path = substitute(system("git rev-parse --show-toplevel"), '\n\+$', '', '')
    let l:import_sort_executable = s:project_root_path . '/node_modules/.bin/import-sort'

    if !executable(l:import_sort_executable)
      let l:import_sort_executable = 'import-sort'
    endif
  endif

  if executable(l:import_sort_executable)
    return l:import_sort_executable
  else
    return ''
  endif
endfun

func! import_sort#run()
  let winview=winsaveview()
  let path = expand("%:p")
  let path = fnameescape(path)

  let l:import_sort_executable = import_sort#find_executable()
  if executable(l:import_sort_executable)
    call system(l:import_sort_executable . ' ' . path . ' --write')
    silent exec "e"
  else
    " Executable bin doesn't exist
    echoerr 'Can not find import-sort'
    return 1
  endif
  call winrestview(winview)
endfun

func! import_sort#stop_auto()
  autocmd! import_sort
endfun

func! import_sort#start_auto()
  augroup import_sort
    autocmd! import_sort
    " do not do import sort on save in diff mode
    if !&diff
      au BufWritePost *.js,*.jsx,*.es6,*.es,*.ts,*.tsx call import_sort#run()
    endif
  augroup END
endfun
