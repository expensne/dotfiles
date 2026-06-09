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

"nmap <leader>s <Action>(SplitHorizontally)
nmap <leader>v <Action>(SplitVertically)
nmap <leader>c <Action>(Unsplit)

" window navigation
nmap <leader>e <Action>(JumpToLastWindow)
nmap <leader>wn <Action>(NextSplitter)
nmap <leader>wN <Action>(PrevSplitter)
nmap <D-l> <Action>(NextSplitter)
nmap <D-h> <Action>(PrevSplitter)

" accessing IDE features
" -- find
nmap <leader>fw <Action>(FindInPath)
nmap <leader>ff <Action>(GotoFile)
nmap <leader>fa <Action>(GotoFile)
nmap <leader>fr <Action>(GotoDeclaration)
nmap <leader>fR <Action>(FindUsages)
"nmap <leader>c <Action>(CallHierarchy)
" -- go to
nmap ]d <Action>(GotoNextError)
nmap [d <Action>(GotoPreviousError)
nmap gd <Action>(GotoDeclaration)
nmap gi <Action>(GotoImplementation)
nmap gD <Action>(GotoTypeDeclaration)
"nmap <leader>s <Action>(ShowUsages)
nmap gS <Action>(GotoSuperMethod)
nmap ]h <Action>(VcsShowNextChangeMarker)
nmap [h <Action>(VcsShowPrevChangeMarker)
" -- refactor
nmap K <Action>(ShowHoverInfo)
nmap <leader>fm <Action>(ReformatCode)
nmap gra <Action>(ShowIntentionActions)
vmap gra <Action>(ShowIntentionActions)
nmap <leader>ca <Action>(ShowIntentionActions)
vmap <leader>ca <Action>(ShowIntentionActions)
nmap grA <Action>(Refactorings.QuickListPopupAction)
vmap grA <Action>(Refactorings.QuickListPopupAction)
nmap grn <Action>(RenameElement)
nmap <leader>cr <Action>(RenameElement)
nmap <leader>cR <Action>(Refactorings.QuickListPopupAction)
"nmap <leader>H <Action>(Replace)
"nmap <leader>A <Action>(Generate)
" -- some more useful actions
" accessing IDE tool windows (use Ctrl prefix for tool windows)
map <D-1> :NERDTreeToggle<cr>
map <D-n> :NERDTreeToggle<cr>
"map <D-2> <Action>(ActivateCommitToolWindow)
"map <D-3> <Action>(ActivateRunToolWindow)
"map <D-4> <Action>(ActivateDebugToolWindow)
"map <D-4> <Action>(ActivateProblemsViewToolWindow)
"map <C-m> Copilot ...
"map <C-p> Terminal ...
nmap <D-z> <Action>(ToggleDistractionFreeMode)

" AceJump instead of leap.vim
nmap s <Action>(AceAction)
nmap S <Action>(AceDeclarationAction)

nmap <leader>t <Action>(ExpandCollapseToggleAction)

" remap ctrl 
nmap <D-d> <C-d>
nmap <D-u> <C-u>
