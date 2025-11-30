" tab navigation
nnoremap <silent> <C-w> :call VSCodeNotify('workbench.action.closeActiveEditor')<CR>
nnoremap <silent> <C-,> :call VSCodeNotify('workbench.action.previousEditor')<CR>
nnoremap <silent> <C-.> :call VSCodeNotify('workbench.action.nextEditor')<CR>
nnoremap <silent> <leader>w :call VSCodeNotify('workbench.action.closeActiveEditor')<CR>
nnoremap <silent> <leader>x :call VSCodeNotify('workbench.action.closeAllEditors')<CR>

" move lines
nnoremap <silent> <C-j> :call VSCodeNotify('editor.action.moveLinesDownAction')<CR>
vnoremap <silent> <C-j> :call VSCodeNotify('editor.action.moveLinesDownAction')<CR>
nnoremap <silent> <C-k> :call VSCodeNotify('editor.action.moveLinesUpAction')<CR>
vnoremap <silent> <C-k> :call VSCodeNotify('editor.action.moveLinesUpAction')<CR>

" some more movement
nnoremap <silent> gb :call VSCodeNotify('workbench.action.navigateBack')<CR>
nnoremap <silent> gf :call VSCodeNotify('workbench.action.navigateForward')<CR>

" special movement only in IDE
nnoremap <silent> [[ :call VSCodeNotify('editor.action.marker.prev')<CR>
nnoremap <silent> ]] :call VSCodeNotify('editor.action.marker.next')<CR>

" accessing IDE features
" -- find
nnoremap <silent> <leader>f :call VSCodeNotify('workbench.action.findInFiles')<CR>
nnoremap <silent> <leader>c :call VSCodeNotify('editor.action.showCallHierarchy')<CR>
" -- go to
nnoremap <silent> <leader>d :call VSCodeNotify('editor.action.goToDeclaration')<CR>
nnoremap <silent> <leader>h :call VSCodeNotify('editor.action.highlightUsages')<CR>
nnoremap <silent> <leader>s :call VSCodeNotify('references-view.findReferences')<CR>
nnoremap <silent> <leader>S :call VSCodeNotify('editor.action.referenceSearch.trigger')<CR>
" -- refactor
nnoremap <silent> <leader>r :call VSCodeNotify('editor.action.rename')<CR>
nnoremap <silent> <leader>R :call VSCodeNotify('editor.action.refactor')<CR>
nnoremap <silent> <leader>= :call VSCodeNotify('editor.action.formatDocument')<CR>
"vnoremap <silent> <leader>o :call VSCodeNotify('editor.action.formatSelection')<CR>
nnoremap <silent> <leader>a :call VSCodeNotify('editor.action.quickFix')<CR>
xnoremap <silent> <C-h> :call VSCodeNotify('editor.action.replace')<CR>
xnoremap <silent> <C-H> :call VSCodeNotify('editor.action.replace')<CR>
" -- some more useful actions
nnoremap <silent> <leader>q :call VSCodeNotify('editor.action.showHover')<CR>
nnoremap <silent> <leader>p :call VSCodeNotify('editor.action.showParameterHints')<CR>
nnoremap <silent> <leader>v :call VSCodeNotify('workbench.view.scm')<CR>
nnoremap <silent> <leader>V :call VSCodeNotify('workbench.action.showSCM')<CR>
nnoremap <silent> <leader>b :call VSCodeNotify('editor.debug.action.toggleBreakpoint')<CR>
" -- run/debug
nnoremap <silent> <leader>\\ :call VSCodeNotify('workbench.action.debug.run')<CR>
nnoremap <silent> <leader>\ :call VSCodeNotify('workbench.action.debug.start')<CR>
nnoremap <silent> <leader>z :call VSCodeNotify('workbench.action.debug.stop')<CR>
