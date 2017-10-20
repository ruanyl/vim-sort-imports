if exists('g:import_sort_loaded')
  finish
endif
let g:import_sort_loaded = 1

if !exists('g:import_sort_auto')
  let g:import_sort_auto = 0
endif

if g:import_sort_auto
  call import_sort#start_auto()
endif

command! SortImport call import_sort#run()
command! StopAutoSortImport call import_sort#stop_auto()
command! StartAutoSortImport call import_sort#start_auto()
