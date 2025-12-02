:silent :echo "Loading idea_keymaps.vim ..."

" some more movement
nmap gb <Action>(Back)
nmap gf <Action>(Forward)

nmap <D-r> <Action>($Redo)

" tab navigation
nmap <D-w> <Action>(CloseContent)
nmap <D-S-w> <Action>(CloseAllEditorsButActive)
nmap <leader>x <Action>(CloseContent)
nmap <leader>X <Action>(CloseAllEditorsButActive)
nmap <leader><S-Tab> <Action>(PreviousTab)
nmap <leader><Tab> <Action>(NextTab)

nmap <leader>h <Action>(SplitHorizontally)
nmap <leader>v <Action>(SplitVertically)
nmap <leader>c <Action>(Unsplit)

" window navigation
nmap <leader>e <Action>(JumpToLastWindow)
nmap <leader>wn <Action>(NextSplitter)
nmap <leader>wN <Action>(PrevSplitter)
nmap <D-l> <Action>(NextSplitter)
nmap <D-h> <Action>(PrevSplitter)

" move lines
"nmap <D-j> <Action>(MoveLineDown)
"xmap <D-j> <Action>(MoveLineDown)
"nmap <D-k> <Action>(MoveLineUp)
"xmap <D-k> <Action>(MoveLineUp)

" accessing IDE features
" -- find
nmap <leader>fa <Action>(FindInPath)
nmap <leader>ff <Action>(GotoFile)
nmap <leader>c <Action>(CallHierarchy)
" -- go to
nmap gd <Action>(GotoDeclaration)
nmap gD <Action>(GotoImplementation)
nmap <leader>ge <Action>(GotoNextError)
nmap <leader>gE <Action>(GotoPreviousError)
nmap <leader>s <Action>(ShowUsages)
nmap <leader>S <Action>(FindUsages)
" -- refactor
" nmap <leader>r :action RenameElement<CR>ea
nmap <leader>r <Action>(RenameElement)
nmap <leader>R <Action>(Refactorings.QuickListPopupAction)
vmap <leader>R <Action>(Refactorings.QuickListPopupAction)
nmap <leader>fm <Action>(ReformatCode)
"vmap <leader>o <Action>(ReformatCode) 
nmap <leader>a <Action>(ShowIntentionActions)
vmap <leader>a <Action>(ShowIntentionActions)
nmap <leader>H <Action>(Replace)
" -- some more useful actions
nmap <leader>g <Action>(Generate)
nmap <leader>q <Action>(ShowHoverInfo)
nmap <leader>p <Action>(ParameterInfo)
nmap <leader>b <Action>(ToggleLineBreakpoint)
" accessing IDE tool windows (use Ctrl prefix for tool windows)
map <D-1> :NERDTreeToggle<cr>
map <D-2> <Action>(ActivateCommitToolWindow)
map <D-3> <Action>(ActivateRunToolWindow)
map <D-4> <Action>(ActivateDebugToolWindow)
map <D-4> <Action>(ActivateProblemsViewToolWindow)
"map <C-m> Copilot ...
nmap <D-z> <Action>(ToggleDistractionFreeMode)

" AceJump instead of leap.vim
nmap s <Action>(AceAction)
nmap S <Action>(AceDeclarationAction)

nmap <leader>t <Action>(ExpandCollapseToggleAction)

" remap ctrl 
nmap <D-d> <C-d>
nmap <D-u> <C-u>
