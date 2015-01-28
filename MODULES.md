# Module Documentation

## Module Ace

### Values


    ace :: Ace


    createEditSession :: forall eff. String -> TextMode -> Ace -> Eff (ace :: EAce | eff) EditSession


    createEditSessionForDocument :: forall eff. Document -> TextMode -> Ace -> Eff (ace :: EAce | eff) EditSession


    edit :: forall eff. String -> Ace -> Eff (ace :: EAce | eff) Editor


    editNode :: forall eff. DOM.Node -> Ace -> Eff (ace :: EAce | eff) Editor


## Module Ace.Anchor

### Values


    create :: forall eff. Document -> Number -> Number -> Eff (ace :: EAce | eff) Anchor


    detach :: forall eff. Anchor -> Eff (ace :: EAce | eff) Unit


    getDocument :: forall eff. Anchor -> Eff (ace :: EAce | eff) Document


    getPosition :: forall eff. Anchor -> Eff (ace :: EAce | eff) Position


    onChange :: forall eff a. Anchor -> (AnchorEvent -> Eff (ace :: EAce | eff) a) -> Eff (ace :: EAce | eff) Unit


    setPosition :: forall eff. Number -> Number -> Boolean -> Anchor -> Eff (ace :: EAce | eff) Unit


## Module Ace.BackgroundTokenizer

### Values


    create :: forall eff. Tokenizer -> Editor -> Eff (ace :: EAce | eff) BackgroundTokenizer


    fireUpdateEvent :: forall eff. Number -> Number -> BackgroundTokenizer -> Eff (ace :: EAce | eff) Unit


    getState :: forall eff. Number -> BackgroundTokenizer -> Eff (ace :: EAce | eff) String


    getTokens :: forall eff. Number -> BackgroundTokenizer -> Eff (ace :: EAce | eff) [TokenInfo]


    onUpdate :: forall eff a. BackgroundTokenizer -> (BackgroundTokenizerEvent -> Eff (ace :: EAce | eff) a) -> Eff (ace :: EAce | eff) Unit


    setDocument :: forall eff. Document -> BackgroundTokenizer -> Eff (ace :: EAce | eff) Unit


    setTokenizer :: forall eff. Tokenizer -> BackgroundTokenizer -> Eff (ace :: EAce | eff) Unit


    start :: forall eff. Number -> BackgroundTokenizer -> Eff (ace :: EAce | eff) Unit


    stop :: forall eff. BackgroundTokenizer -> Eff (ace :: EAce | eff) Unit


## Module Ace.Document

### Values


    create :: forall eff. Maybe String -> Eff (ace :: EAce | eff) Document


    createAnchor :: forall eff. Number -> Number -> Document -> Eff (ace :: EAce | eff) Anchor


    createFromLines :: forall eff. [String] -> Eff (ace :: EAce | eff) Document


    getAllLines :: forall eff. Document -> Eff (ace :: EAce | eff) [String]


    getLength :: forall eff. Document -> Eff (ace :: EAce | eff) Number


    getLine :: forall eff. Number -> Document -> Eff (ace :: EAce | eff) String


    getLines :: forall eff. Number -> Number -> Document -> Eff (ace :: EAce | eff) [String]


    getNewLineCharacter :: forall eff. Document -> Eff (ace :: EAce | eff) String


    getNewLineMode :: forall eff. Document -> Eff (ace :: EAce | eff) NewlineMode


    getTextRange :: forall eff. Range -> Document -> Eff (ace :: EAce | eff) String


    getValue :: forall eff. Document -> Eff (ace :: EAce | eff) String


    indexToPosition :: forall eff. Number -> Number -> Document -> Eff (ace :: EAce | eff) Position


    insert :: forall eff. Position -> String -> Document -> Eff (ace :: EAce | eff) Unit


    insertInLine :: forall eff. Position -> String -> Document -> Eff (ace :: EAce | eff) Unit


    insertNewLine :: forall eff. Position -> Document -> Eff (ace :: EAce | eff) Unit


    isNewLine :: forall eff. String -> Document -> Eff (ace :: EAce | eff) Boolean


    onChange :: forall eff a. Document -> (DocumentEvent -> Eff (ace :: EAce | eff) a) -> Eff (ace :: EAce | eff) Unit


    positionToIndex :: forall eff. Position -> Number -> Document -> Eff (ace :: EAce | eff) Number


    remove :: forall eff. Range -> Document -> Eff (ace :: EAce | eff) Unit


    removeInLine :: forall eff. Number -> Number -> Number -> Document -> Eff (ace :: EAce | eff) Unit


    removeLines :: forall eff. Number -> Number -> Document -> Eff (ace :: EAce | eff) [String]


    removeNewLine :: forall eff. Number -> Document -> Eff (ace :: EAce | eff) Unit


    replace :: forall eff. Range -> String -> Document -> Eff (ace :: EAce | eff) Unit


    setNewLineMode :: forall eff. NewlineMode -> Document -> Eff (ace :: EAce | eff) Unit


    setValue :: forall eff. String -> Document -> Eff (ace :: EAce | eff) Unit


## Module Ace.EditSession

### Types


    type DynamicMarker eff a = forall h. STArray h String -> DOM.Node -> Eff (st :: ST h | eff) a


### Values


    addDynamicMarker :: forall eff a. DynamicMarker (ace :: EAce | eff) a -> Boolean -> EditSession -> Eff (ace :: EAce | eff) Unit


    addFold :: forall eff. String -> Range -> EditSession -> Eff (ace :: EAce | eff) Unit


    addGutterDecoration :: forall eff. Number -> String -> EditSession -> Eff (ace :: EAce | eff) Unit


    addMarker :: forall eff. Range -> String -> String -> Boolean -> EditSession -> Eff (ace :: EAce | eff) Unit


    adjustWrapLimit :: forall eff. Number -> EditSession -> Eff (ace :: EAce | eff) Boolean


    clearAnnotations :: forall eff. EditSession -> Eff (ace :: EAce | eff) Unit


    clearBreakpoint :: forall eff. Number -> EditSession -> Eff (ace :: EAce | eff) Unit


    clearBreakpoints :: forall eff. EditSession -> Eff (ace :: EAce | eff) Unit


    create :: forall eff. String -> Maybe String -> Eff (ace :: EAce | eff) EditSession


    createFromLines :: forall eff. [String] -> Maybe String -> Eff (ace :: EAce | eff) EditSession


    createWithMode :: forall eff. String -> Maybe TextMode -> Eff (ace :: EAce | eff) EditSession


    detectNewLine :: forall eff. String -> EditSession -> Eff (ace :: EAce | eff) Unit


    documentToScreenColumn :: forall eff. Number -> Number -> EditSession -> Eff (ace :: EAce | eff) Number


    documentToScreenPosition :: forall eff. Number -> Number -> EditSession -> Eff (ace :: EAce | eff) Position


    documentToScreenRow :: forall eff. Number -> Number -> EditSession -> Eff (ace :: EAce | eff) Unit


    duplicateLines :: forall eff. Number -> Number -> EditSession -> Eff (ace :: EAce | eff) Number


    findMatchingBracket :: forall eff. Position -> EditSession -> Eff (ace :: EAce | eff) Unit


    getAWordRange :: forall eff. Number -> Number -> EditSession -> Eff (ace :: EAce | eff) Range


    getAnnotations :: forall eff. EditSession -> Eff (ace :: EAce | eff) [Annotation]


    getBackgroundTokenizer :: forall eff. EditSession -> Eff (ace :: EAce | eff) BackgroundTokenizer


    getBreakpoints :: forall eff. EditSession -> Eff (ace :: EAce | eff) [Number]


    getDisplayTokens :: forall eff. String -> Number -> EditSession -> Eff (ace :: EAce | eff) Unit


    getDocument :: forall eff. EditSession -> Eff (ace :: EAce | eff) Document


    getDocumentLastRowColumn :: forall eff. Number -> Number -> EditSession -> Eff (ace :: EAce | eff) Number


    getDocumentLastRowColumnPosition :: forall eff. Number -> Number -> EditSession -> Eff (ace :: EAce | eff) Number


    getLength :: forall eff. EditSession -> Eff (ace :: EAce | eff) Number


    getLine :: forall eff. Number -> EditSession -> Eff (ace :: EAce | eff) String


    getLines :: forall eff. Number -> Number -> EditSession -> Eff (ace :: EAce | eff) [String]


    getMode :: forall eff. EditSession -> Eff (ace :: EAce | eff) TextMode


    getNewLineMode :: forall eff. EditSession -> Eff (ace :: EAce | eff) String


    getOverwrite :: forall eff. EditSession -> Eff (ace :: EAce | eff) Boolean


    getRowLength :: forall eff. Number -> EditSession -> Eff (ace :: EAce | eff) Number


    getRowSplitData :: forall eff. EditSession -> Eff (ace :: EAce | eff) String


    getScreenLastRowColumn :: forall eff. Number -> EditSession -> Eff (ace :: EAce | eff) Number


    getScreenLength :: forall eff. EditSession -> Eff (ace :: EAce | eff) Number


    getScreenTabSize :: forall eff. Number -> EditSession -> Eff (ace :: EAce | eff) Number


    getScreenWidth :: forall eff. EditSession -> Eff (ace :: EAce | eff) Number


    getScrollLeft :: forall eff. EditSession -> Eff (ace :: EAce | eff) Number


    getScrollTop :: forall eff. EditSession -> Eff (ace :: EAce | eff) Number


    getSelection :: forall eff. EditSession -> Eff (ace :: EAce | eff) Selection


    getState :: forall eff. Number -> EditSession -> Eff (ace :: EAce | eff) String


    getStringScreenWidth :: forall eff. String -> Number -> Number -> EditSession -> Eff (ace :: EAce | eff) [Number]


    getTabSize :: forall eff. EditSession -> Eff (ace :: EAce | eff) String


    getTabString :: forall eff. EditSession -> Eff (ace :: EAce | eff) String


    getTextRange :: forall eff. Range -> EditSession -> Eff (ace :: EAce | eff) String


    getTokenAt :: forall eff. Number -> Number -> EditSession -> Eff (ace :: EAce | eff) TokenInfo


    getTokens :: forall eff. Number -> EditSession -> Eff (ace :: EAce | eff) [TokenInfo]


    getUndoManager :: forall eff. EditSession -> Eff (ace :: EAce | eff) UndoManager


    getUseSoftTabs :: forall eff. EditSession -> Eff (ace :: EAce | eff) Boolean


    getUseWorker :: forall eff. EditSession -> Eff (ace :: EAce | eff) Boolean


    getUseWrapMode :: forall eff. EditSession -> Eff (ace :: EAce | eff) Boolean


    getValue :: forall eff. EditSession -> Eff (ace :: EAce | eff) String


    getWordRange :: forall eff. Number -> Number -> EditSession -> Eff (ace :: EAce | eff) Range


    getWrapLimit :: forall eff. EditSession -> Eff (ace :: EAce | eff) Number


    getWrapLimitRange :: forall eff. EditSession -> Eff (ace :: EAce | eff) { max :: Number, min :: Number }


    highlight :: forall eff. String -> EditSession -> Eff (ace :: EAce | eff) Unit


    indentRows :: forall eff. Number -> Number -> String -> EditSession -> Eff (ace :: EAce | eff) Unit


    insert :: forall eff. Position -> String -> EditSession -> Eff (ace :: EAce | eff) Unit


    isTabStop :: forall eff. Position -> EditSession -> Eff (ace :: EAce | eff) Boolean


    mode :: forall eff. TextMode -> EditSession -> Eff (ace :: EAce | eff) Unit


    moveLinesDown :: forall eff. Number -> Number -> EditSession -> Eff (ace :: EAce | eff) Number


    moveLinesUp :: forall eff. Number -> Number -> EditSession -> Eff (ace :: EAce | eff) Number


    moveText :: forall eff. Range -> Position -> EditSession -> Eff (ace :: EAce | eff) Range


    onChange :: forall eff a. EditSession -> Eff (ace :: EAce | eff) a -> Eff (ace :: EAce | eff) Unit


    onChangeAnnotation :: forall eff a. EditSession -> Eff (ace :: EAce | eff) a -> Eff (ace :: EAce | eff) Unit


    onChangeBackMarker :: forall eff a. EditSession -> Eff (ace :: EAce | eff) a -> Eff (ace :: EAce | eff) Unit


    onChangeBreakpoint :: forall eff a. EditSession -> Eff (ace :: EAce | eff) a -> Eff (ace :: EAce | eff) Unit


    onChangeFold :: forall eff a. EditSession -> Eff (ace :: EAce | eff) a -> Eff (ace :: EAce | eff) Unit


    onChangeFrontMarker :: forall eff a. EditSession -> Eff (ace :: EAce | eff) a -> Eff (ace :: EAce | eff) Unit


    onChangeMode :: forall eff a. EditSession -> Eff (ace :: EAce | eff) a -> Eff (ace :: EAce | eff) Unit


    onChangeOverwrite :: forall eff a. EditSession -> Eff (ace :: EAce | eff) a -> Eff (ace :: EAce | eff) Unit


    onChangeScrollLeft :: forall eff a. EditSession -> (Number -> Eff (ace :: EAce | eff) a) -> Eff (ace :: EAce | eff) Unit


    onChangeScrollTop :: forall eff a. EditSession -> (Number -> Eff (ace :: EAce | eff) a) -> Eff (ace :: EAce | eff) Unit


    onChangeTabSize :: forall eff a. EditSession -> Eff (ace :: EAce | eff) a -> Eff (ace :: EAce | eff) Unit


    onChangeWrapLimit :: forall eff a. EditSession -> Eff (ace :: EAce | eff) a -> Eff (ace :: EAce | eff) Unit


    onChangeWrapMode :: forall eff a. EditSession -> Eff (ace :: EAce | eff) a -> Eff (ace :: EAce | eff) Unit


    onReloadTokenizer :: forall eff. EditSession -> Eff (ace :: EAce | eff) Unit


    onTokenizerUpdate :: forall eff a. EditSession -> Eff (ace :: EAce | eff) a -> Eff (ace :: EAce | eff) Unit


    outdentRows :: forall eff. Range -> EditSession -> Eff (ace :: EAce | eff) Unit


    remove :: forall eff. Range -> EditSession -> Eff (ace :: EAce | eff) Unit


    removeGutterDecoration :: forall eff. Number -> String -> EditSession -> Eff (ace :: EAce | eff) Unit


    removeMarker :: forall eff. Number -> EditSession -> Eff (ace :: EAce | eff) Unit


    replace :: forall eff. Range -> String -> EditSession -> Eff (ace :: EAce | eff) Unit


    resetRowCache :: forall eff. Number -> EditSession -> Eff (ace :: EAce | eff) Unit


    screenToDocumentColumn :: forall eff. Number -> Number -> EditSession -> Eff (ace :: EAce | eff) Unit


    screenToDocumentPosition :: forall eff. Number -> Number -> EditSession -> Eff (ace :: EAce | eff) Position


    setAnnotations :: forall eff. [Annotation] -> EditSession -> Eff (ace :: EAce | eff) Unit


    setBreakpoint :: forall eff. Number -> String -> EditSession -> Eff (ace :: EAce | eff) Unit


    setBreakpoints :: forall eff. [Number] -> EditSession -> Eff (ace :: EAce | eff) Unit


    setDocument :: forall eff. Document -> EditSession -> Eff (ace :: EAce | eff) Unit


    setMode :: forall eff. String -> EditSession -> Eff (ace :: EAce | eff) Unit


    setNewLineMode :: forall eff. String -> EditSession -> Eff (ace :: EAce | eff) Unit


    setOverwrite :: forall eff. Boolean -> EditSession -> Eff (ace :: EAce | eff) Unit


    setScrollLeft :: forall eff. EditSession -> Eff (ace :: EAce | eff) Unit


    setScrollTop :: forall eff. Number -> EditSession -> Eff (ace :: EAce | eff) Unit


    setTabSize :: forall eff. Number -> EditSession -> Eff (ace :: EAce | eff) Unit


    setUndoManager :: forall eff. UndoManager -> EditSession -> Eff (ace :: EAce | eff) Unit


    setUndoSelect :: forall eff. Boolean -> EditSession -> Eff (ace :: EAce | eff) Unit


    setUseSoftTabs :: forall eff. Boolean -> EditSession -> Eff (ace :: EAce | eff) Unit


    setUseWorker :: forall eff. Boolean -> EditSession -> Eff (ace :: EAce | eff) Unit


    setUseWrapMode :: forall eff. Boolean -> EditSession -> Eff (ace :: EAce | eff) Unit


    setValue :: forall eff. String -> EditSession -> Eff (ace :: EAce | eff) Unit


    setWrapLimitRange :: forall eff. Number -> Number -> EditSession -> Eff (ace :: EAce | eff) Unit


    toggleOverwrite :: forall eff. EditSession -> Eff (ace :: EAce | eff) Unit


## Module Ace.Editor

### Values


    blockIndent :: forall eff. Editor -> Eff (ace :: EAce | eff) Unit


    blockOutdent :: forall eff. Maybe String -> Editor -> Eff (ace :: EAce | eff) Unit


    blur :: forall eff. Editor -> Eff (ace :: EAce | eff) Unit


    centerSelection :: forall eff. Editor -> Eff (ace :: EAce | eff) Unit


    clearSelection :: forall eff. Editor -> Eff (ace :: EAce | eff) Unit


    copyLinesDown :: forall eff. Editor -> Eff (ace :: EAce | eff) Number


    copyLinesUp :: forall eff. Editor -> Eff (ace :: EAce | eff) Number


    create :: forall eff. VirtualRenderer -> Maybe EditSession -> Eff (ace :: EAce | eff) Editor


    destroy :: forall eff. Editor -> Eff (ace :: EAce | eff) Unit


    find :: forall eff. String -> Maybe SearchOptions -> Maybe Boolean -> Editor -> Eff (ace :: EAce | eff) Unit


    findNext :: forall eff. Maybe SearchOptions -> Maybe Boolean -> Editor -> Eff (ace :: EAce | eff) Unit


    findPrevious :: forall eff. Maybe SearchOptions -> Maybe Boolean -> Editor -> Eff (ace :: EAce | eff) Unit


    focus :: forall eff. Editor -> Eff (ace :: EAce | eff) Unit


    getBehavioursEnabled :: forall eff. Editor -> Eff (ace :: EAce | eff) Boolean


    getContainer :: forall eff. Editor -> Eff (ace :: EAce | eff) DOM.Node


    getCopyText :: forall eff. Editor -> Eff (ace :: EAce | eff) String


    getCursorPosition :: forall eff. Editor -> Eff (ace :: EAce | eff) Position


    getCursorPositionScreen :: forall eff. Editor -> Eff (ace :: EAce | eff) Number


    getDragDelay :: forall eff. Editor -> Eff (ace :: EAce | eff) Number


    getFirstVisibleRow :: forall eff. Editor -> Eff (ace :: EAce | eff) Number


    getHighlightActiveLine :: forall eff. Editor -> Eff (ace :: EAce | eff) Unit


    getHighlightSelectedWord :: forall eff. Editor -> Eff (ace :: EAce | eff) Boolean


    getKeyboardHandler :: forall eff. Editor -> Eff (ace :: EAce | eff) String


    getLastSearchOptions :: forall eff. Editor -> Eff (ace :: EAce | eff) SearchOptions


    getLastVisibleRow :: forall eff. Editor -> Eff (ace :: EAce | eff) Number


    getNumberAt :: forall eff. Editor -> Eff (ace :: EAce | eff) Number


    getOverwrite :: forall eff. Editor -> Eff (ace :: EAce | eff) Boolean


    getPasteEventText :: forall eff. PasteEvent -> Eff (ace :: EAce | eff) String


    getPrintMarginColumn :: forall eff. Editor -> Eff (ace :: EAce | eff) Number


    getReadOnly :: forall eff. Editor -> Eff (ace :: EAce | eff) Boolean


    getRenderer :: forall eff. Editor -> Eff (ace :: EAce | eff) VirtualRenderer


    getScrollSpeed :: forall eff. Editor -> Eff (ace :: EAce | eff) Number


    getSelection :: forall eff. Editor -> Eff (ace :: EAce | eff) Selection


    getSelectionRange :: forall eff. Editor -> Eff (ace :: EAce | eff) Range


    getSelectionStyle :: forall eff. Editor -> Eff (ace :: EAce | eff) String


    getSession :: forall eff. Editor -> Eff (ace :: EAce | eff) EditSession


    getShowFoldWidgets :: forall eff. Editor -> Eff (ace :: EAce | eff) Unit


    getShowInvisibles :: forall eff. Editor -> Eff (ace :: EAce | eff) Boolean


    getShowPrintMargin :: forall eff. Editor -> Eff (ace :: EAce | eff) Boolean


    getTheme :: forall eff. Editor -> Eff (ace :: EAce | eff) String


    getValue :: forall eff. Editor -> Eff (ace :: EAce | eff) String


    getWrapBehavioursEnabled :: forall eff. Editor -> Eff (ace :: EAce | eff) Unit


    gotoLine :: forall eff. Number -> Maybe Number -> Maybe Boolean -> Editor -> Eff (ace :: EAce | eff) Unit


    gotoPageDown :: forall eff. Editor -> Eff (ace :: EAce | eff) Unit


    gotoPageUp :: forall eff. Editor -> Eff (ace :: EAce | eff) Unit


    indent :: forall eff. Editor -> Eff (ace :: EAce | eff) Unit


    insert :: forall eff. String -> Editor -> Eff (ace :: EAce | eff) Unit


    isFocused :: forall eff. Editor -> Eff (ace :: EAce | eff) Unit


    isInMultiSelectMode :: forall eff. Editor -> Eff (ace :: EAce | eff) Boolean


    isRowFullyVisible :: forall eff. Number -> Editor -> Eff (ace :: EAce | eff) Boolean


    isRowVisible :: forall eff. Number -> Editor -> Eff (ace :: EAce | eff) Boolean


    jumpToMatching :: forall eff. Editor -> Eff (ace :: EAce | eff) Unit


    modifyNumber :: forall eff. Number -> Editor -> Eff (ace :: EAce | eff) Unit


    moveCursorTo :: forall eff. Number -> Maybe Number -> Maybe Boolean -> Editor -> Eff (ace :: EAce | eff) Unit


    moveCursorToPosition :: forall eff. Position -> Editor -> Eff (ace :: EAce | eff) Unit


    moveLinesDown :: forall eff. Editor -> Eff (ace :: EAce | eff) Number


    moveLinesUp :: forall eff. Editor -> Eff (ace :: EAce | eff) Number


    navigateDown :: forall eff. Maybe Number -> Editor -> Eff (ace :: EAce | eff) Unit


    navigateFileEnd :: forall eff. Editor -> Eff (ace :: EAce | eff) Unit


    navigateFileStart :: forall eff. Editor -> Eff (ace :: EAce | eff) Unit


    navigateLeft :: forall eff. Maybe Number -> Editor -> Eff (ace :: EAce | eff) Unit


    navigateLineEnd :: forall eff. Editor -> Eff (ace :: EAce | eff) Unit


    navigateLineStart :: forall eff. Editor -> Eff (ace :: EAce | eff) Unit


    navigateRight :: forall eff. Number -> Editor -> Eff (ace :: EAce | eff) Unit


    navigateTo :: forall eff. Number -> Number -> Editor -> Eff (ace :: EAce | eff) Unit


    navigateUp :: forall eff. Maybe Number -> Editor -> Eff (ace :: EAce | eff) Unit


    navigateWordLeft :: forall eff. Editor -> Eff (ace :: EAce | eff) Unit


    navigateWordRight :: forall eff. Editor -> Eff (ace :: EAce | eff) Unit


    onBlur :: forall eff a. Editor -> Eff (ace :: EAce | eff) a -> Eff (ace :: EAce | eff) Unit


    onChangeSelectionStyle :: forall eff. Editor -> Eff (ace :: EAce | eff) Unit -> Eff (ace :: EAce | eff) Unit


    onChangeSession :: forall eff. Editor -> ({ session :: EditSession, oldSession :: EditSession } -> Eff (ace :: EAce | eff) Unit) -> Eff (ace :: EAce | eff) Unit


    onCopy :: forall eff a. Editor -> (String -> Eff (ace :: EAce | eff) a) -> Eff (ace :: EAce | eff) Unit


    onFocus :: forall eff a. Editor -> Eff (ace :: EAce | eff) a -> Eff (ace :: EAce | eff) Unit


    onPaste :: forall eff a. Editor -> (PasteEvent -> Eff (ace :: EAce | eff) a) -> Eff (ace :: EAce | eff) Unit


    redo :: forall eff. Editor -> Eff (ace :: EAce | eff) Unit


    remove :: forall eff. String -> Editor -> Eff (ace :: EAce | eff) Unit


    removeLines :: forall eff. Editor -> Eff (ace :: EAce | eff) Unit


    removeToLineEnd :: forall eff. Editor -> Eff (ace :: EAce | eff) Unit


    removeToLineStart :: forall eff. Editor -> Eff (ace :: EAce | eff) Unit


    removeWordLeft :: forall eff. Editor -> Eff (ace :: EAce | eff) Unit


    removeWordRight :: forall eff. Editor -> Eff (ace :: EAce | eff) Unit


    replace :: forall eff. String -> Maybe SearchOptions -> Editor -> Eff (ace :: EAce | eff) Unit


    replaceAll :: forall eff. String -> Maybe SearchOptions -> Editor -> Eff (ace :: EAce | eff) Unit


    resize :: forall eff. Maybe Boolean -> Editor -> Eff (ace :: EAce | eff) Unit


    scrollPageDown :: forall eff. Editor -> Eff (ace :: EAce | eff) Unit


    scrollPageUp :: forall eff. Editor -> Eff (ace :: EAce | eff) Unit


    scrollToLine :: forall eff. Number -> Boolean -> Boolean -> Eff (ace :: EAce | eff) Unit -> Editor -> Eff (ace :: EAce | eff) Unit


    scrollToRow :: forall eff. Editor -> Eff (ace :: EAce | eff) Unit


    selectAll :: forall eff. Editor -> Eff (ace :: EAce | eff) Unit


    selectMoreLines :: forall eff. Number -> Editor -> Eff (ace :: EAce | eff) Unit


    selectPageDown :: forall eff. Editor -> Eff (ace :: EAce | eff) Unit


    selectPageUp :: forall eff. Editor -> Eff (ace :: EAce | eff) Unit


    setBehavioursEnabled :: forall eff. Boolean -> Editor -> Eff (ace :: EAce | eff) Unit


    setDragDelay :: forall eff. Number -> Editor -> Eff (ace :: EAce | eff) Unit


    setFontSize :: forall eff. String -> Editor -> Eff (ace :: EAce | eff) Unit


    setHighlightActiveLine :: forall eff. Boolean -> Editor -> Eff (ace :: EAce | eff) Unit


    setHighlightSelectedWord :: forall eff. Boolean -> Editor -> Eff (ace :: EAce | eff) Unit


    setKeyboardHandler :: forall eff. String -> Editor -> Eff (ace :: EAce | eff) Unit


    setOverwrite :: forall eff. Boolean -> Editor -> Eff (ace :: EAce | eff) Unit


    setPasteEventText :: forall eff. String -> PasteEvent -> Eff (ace :: EAce | eff) Unit


    setPrintMarginColumn :: forall eff. Number -> Editor -> Eff (ace :: EAce | eff) Unit


    setReadOnly :: forall eff. Boolean -> Editor -> Eff (ace :: EAce | eff) Unit


    setScrollSpeed :: forall eff. Number -> Editor -> Eff (ace :: EAce | eff) Unit


    setSelectionStyle :: forall eff. String -> Editor -> Eff (ace :: EAce | eff) Unit


    setSession :: forall eff. EditSession -> Editor -> Eff (ace :: EAce | eff) Unit


    setShowFoldWidgets :: forall eff. Boolean -> Editor -> Eff (ace :: EAce | eff) Unit


    setShowInvisibles :: forall eff. Boolean -> Editor -> Eff (ace :: EAce | eff) Unit


    setShowPrintMargin :: forall eff. Boolean -> Editor -> Eff (ace :: EAce | eff) Unit


    setStyle :: forall eff. String -> Editor -> Eff (ace :: EAce | eff) Unit


    setTheme :: forall eff. String -> Editor -> Eff (ace :: EAce | eff) Unit


    setValue :: forall eff. String -> Maybe Number -> Editor -> Eff (ace :: EAce | eff) String


    setWrapBehavioursEnabled :: forall eff. Boolean -> Editor -> Eff (ace :: EAce | eff) Unit


    splitLine :: forall eff. Editor -> Eff (ace :: EAce | eff) Unit


    toLowerCase :: forall eff. Editor -> Eff (ace :: EAce | eff) Unit


    toUpperCase :: forall eff. Editor -> Eff (ace :: EAce | eff) Unit


    toggleCommentLines :: forall eff. Editor -> Eff (ace :: EAce | eff) Unit


    toggleOverwrite :: forall eff. Editor -> Eff (ace :: EAce | eff) Unit


    transposeLetters :: forall eff. Editor -> Eff (ace :: EAce | eff) Unit


    undo :: forall eff. Editor -> Eff (ace :: EAce | eff) Unit


    unsetStyle :: forall eff. Editor -> Eff (ace :: EAce | eff) Unit


## Module Ace.Internal

### Types


    data Nullable :: * -> *


### Values


    toNullable :: forall a. Maybe a -> Nullable a


## Module Ace.Range

### Values


    clipRows :: forall eff. Number -> Number -> Range -> Eff (ace :: EAce | eff) Range


    clone :: forall eff. Range -> Eff (ace :: EAce | eff) Range


    collapseRows :: forall eff. Range -> Eff (ace :: EAce | eff) Range


    compare :: forall eff. Number -> Number -> Range -> Eff (ace :: EAce | eff) Number


    compareEnd :: forall eff. Number -> Number -> Range -> Eff (ace :: EAce | eff) Number


    compareInside :: forall eff. Number -> Number -> Range -> Eff (ace :: EAce | eff) Number


    comparePoint :: forall eff. Range -> Range -> Eff (ace :: EAce | eff) Number


    compareRange :: forall eff. Range -> Range -> Eff (ace :: EAce | eff) Number


    compareStart :: forall eff. Number -> Number -> Range -> Eff (ace :: EAce | eff) Number


    contains :: forall eff. Number -> Number -> Range -> Eff (ace :: EAce | eff) Boolean


    containsRange :: forall eff. Range -> Range -> Eff (ace :: EAce | eff) Boolean


    create :: forall eff. Number -> Number -> Number -> Number -> Eff (ace :: EAce | eff) Range


    extend :: forall eff. Number -> Number -> Range -> Eff (ace :: EAce | eff) Range


    fromPoints :: forall eff. Range -> Range -> Eff (ace :: EAce | eff) Range


    getEnd :: forall eff. Range -> Eff (ace :: EAce | eff) Position


    getEndRow :: forall eff. Range -> Eff (ace :: EAce | eff) Number


    getStartColumn :: forall eff. Range -> Eff (ace :: EAce | eff) Number


    inside :: forall eff. Number -> Number -> Range -> Eff (ace :: EAce | eff) Boolean


    insideEnd :: forall eff. Number -> Number -> Range -> Eff (ace :: EAce | eff) Boolean


    insideStart :: forall eff. Number -> Number -> Range -> Eff (ace :: EAce | eff) Boolean


    intersects :: forall eff. Range -> Range -> Eff (ace :: EAce | eff) Boolean


    isEmpty :: forall eff. Range -> Eff (ace :: EAce | eff) Boolean


    isEnd :: forall eff. Number -> Number -> Range -> Eff (ace :: EAce | eff) Boolean


    isEqual :: forall eff. Range -> Range -> Eff (ace :: EAce | eff) Unit


    isMultiLine :: forall eff. Range -> Eff (ace :: EAce | eff) Boolean


    isStart :: forall eff. Number -> Number -> Range -> Eff (ace :: EAce | eff) Boolean


    setEnd :: forall eff. Number -> Number -> Range -> Eff (ace :: EAce | eff) Unit


    setStart :: forall eff. Number -> Number -> Range -> Eff (ace :: EAce | eff) Unit


    toScreenRange :: forall eff. EditSession -> Range -> Eff (ace :: EAce | eff) Range


    toString :: forall eff. Range -> Eff (ace :: EAce | eff) Unit


## Module Ace.ScrollBar

### Values


    create :: forall eff. DOM.Node -> VirtualRenderer -> Eff (ace :: EAce | eff) ScrollBar


    getWidth :: forall eff. ScrollBar -> Eff (ace :: EAce | eff) Number


    onScroll :: forall eff a. ScrollBar -> Eff (ace :: EAce | eff) a -> Eff (ace :: EAce | eff) Unit


    setHeight :: forall eff. Number -> ScrollBar -> Eff (ace :: EAce | eff) Unit


    setInnerHeight :: forall eff. Number -> ScrollBar -> Eff (ace :: EAce | eff) Unit


    setScrollTop :: forall eff. Number -> ScrollBar -> Eff (ace :: EAce | eff) Unit


## Module Ace.Search

### Values


    create :: forall eff. Eff (ace :: EAce | eff) Search


    find :: forall eff. EditSession -> Search -> Eff (ace :: EAce | eff) Range


    findAll :: forall eff. EditSession -> Search -> Eff (ace :: EAce | eff) [Range]


    replace :: forall eff. String -> String -> Search -> Eff (ace :: EAce | eff) String


    set :: forall eff. SearchOptions -> Search -> Eff (ace :: EAce | eff) Search


## Module Ace.Selection

### Values


    addRange :: forall eff. Range -> Selection -> Eff (ace :: EAce | eff) Unit


    clearSelection :: forall eff. Selection -> Eff (ace :: EAce | eff) Unit


    create :: forall eff. EditSession -> Eff (ace :: EAce | eff) Selection


    fromOrientedRange :: forall eff. Range -> Selection -> Eff (ace :: EAce | eff) Unit


    getAllRanges :: forall eff. Selection -> Eff (ace :: EAce | eff) [Range]


    getCursor :: forall eff. Selection -> Eff (ace :: EAce | eff) Position


    getRange :: forall eff. Selection -> Eff (ace :: EAce | eff) Range


    getSelectionAnchor :: forall eff. Selection -> Eff (ace :: EAce | eff) Position


    getSelectionLead :: forall eff. Selection -> Eff (ace :: EAce | eff) Position


    getWordRange :: forall eff. Selection -> Eff (ace :: EAce | eff) Unit


    isBackwards :: forall eff. Selection -> Eff (ace :: EAce | eff) Boolean


    isEmpty :: forall eff. Selection -> Eff (ace :: EAce | eff) Boolean


    isMultiLine :: forall eff. Selection -> Eff (ace :: EAce | eff) Boolean


    moveCursorBy :: forall eff. Number -> Number -> Selection -> Eff (ace :: EAce | eff) Unit


    moveCursorDown :: forall eff. Selection -> Eff (ace :: EAce | eff) Unit


    moveCursorFileEnd :: forall eff. Selection -> Eff (ace :: EAce | eff) Unit


    moveCursorFileStart :: forall eff. Selection -> Eff (ace :: EAce | eff) Unit


    moveCursorLeft :: forall eff. Selection -> Eff (ace :: EAce | eff) Unit


    moveCursorLineEnd :: forall eff. Selection -> Eff (ace :: EAce | eff) Unit


    moveCursorLineStart :: forall eff. Selection -> Eff (ace :: EAce | eff) Unit


    moveCursorLongWordLeft :: forall eff. Selection -> Eff (ace :: EAce | eff) Unit


    moveCursorLongWordRight :: forall eff. Selection -> Eff (ace :: EAce | eff) Unit


    moveCursorRight :: forall eff. Selection -> Eff (ace :: EAce | eff) Unit


    moveCursorTo :: forall eff. Number -> Number -> Maybe Boolean -> Selection -> Eff (ace :: EAce | eff) Unit


    moveCursorToPosition :: forall eff. Position -> Selection -> Eff (ace :: EAce | eff) Unit


    moveCursorToScreen :: forall eff. Number -> Number -> Boolean -> Selection -> Eff (ace :: EAce | eff) Unit


    moveCursorUp :: forall eff. Selection -> Eff (ace :: EAce | eff) Unit


    moveCursorWordLeft :: forall eff. Selection -> Eff (ace :: EAce | eff) Unit


    moveCursorWordRight :: forall eff. Selection -> Eff (ace :: EAce | eff) Unit


    onChangeCursor :: forall eff a. Selection -> Eff (ace :: EAce | eff) a -> Eff (ace :: EAce | eff) Unit


    onChangeSelection :: forall eff a. Selection -> Eff (ace :: EAce | eff) a -> Eff (ace :: EAce | eff) Unit


    selectAWord :: forall eff. Selection -> Eff (ace :: EAce | eff) Unit


    selectAll :: forall eff. Selection -> Eff (ace :: EAce | eff) Unit


    selectDown :: forall eff. Selection -> Eff (ace :: EAce | eff) Unit


    selectFileEnd :: forall eff. Selection -> Eff (ace :: EAce | eff) Unit


    selectFileStart :: forall eff. Selection -> Eff (ace :: EAce | eff) Unit


    selectLeft :: forall eff. Selection -> Eff (ace :: EAce | eff) Unit


    selectLine :: forall eff. Selection -> Eff (ace :: EAce | eff) Unit


    selectLineEnd :: forall eff. Selection -> Eff (ace :: EAce | eff) Unit


    selectLineStart :: forall eff. Selection -> Eff (ace :: EAce | eff) Unit


    selectRight :: forall eff. Selection -> Eff (ace :: EAce | eff) Unit


    selectTo :: forall eff. Number -> Number -> Selection -> Eff (ace :: EAce | eff) Unit


    selectToPosition :: forall eff. Position -> Selection -> Eff (ace :: EAce | eff) Unit


    selectUp :: forall eff. Selection -> Eff (ace :: EAce | eff) Unit


    selectWord :: forall eff. Selection -> Eff (ace :: EAce | eff) Unit


    selectWordLeft :: forall eff. Selection -> Eff (ace :: EAce | eff) Unit


    selectWordRight :: forall eff. Selection -> Eff (ace :: EAce | eff) Unit


    setRange :: forall eff. Range -> Boolean -> Selection -> Eff (ace :: EAce | eff) Unit


    setSelectionAnchor :: forall eff. Number -> Number -> Selection -> Eff (ace :: EAce | eff) Unit


    setSelectionRange :: forall eff. Range -> Selection -> Eff (ace :: EAce | eff) Unit


    shiftSelection :: forall eff. Number -> Selection -> Eff (ace :: EAce | eff) Unit


## Module Ace.TokenIterator

### Values


    create :: forall eff. EditSession -> Number -> Number -> Eff (ace :: EAce | eff) TokenIterator


    getCurrentToken :: forall eff. TokenIterator -> Eff (ace :: EAce | eff) TokenInfo


    getCurrentTokenColumn :: forall eff. TokenIterator -> Eff (ace :: EAce | eff) Number


    getCurrentTokenRow :: forall eff. TokenIterator -> Eff (ace :: EAce | eff) Number


    stepBackward :: forall eff. TokenIterator -> Eff (ace :: EAce | eff) [String]


    stepForward :: forall eff. TokenIterator -> Eff (ace :: EAce | eff) String


## Module Ace.Tokenizer

### Values


    create :: forall eff. Rules -> String -> Eff (ace :: EAce | eff) Tokenizer


    getLineTokens :: forall eff. Tokenizer -> Eff (ace :: EAce | eff) { state :: String, tokens :: [TokenInfo] }


## Module Ace.Types

### Types


    data Ace


    data Anchor


    type AnchorEvent = { value :: Position, old :: Position }


    type Annotation = { "type" :: String, text :: String, column :: Number, row :: Number }


    data BackgroundTokenizer


    data BackgroundTokenizerEvent


    data Document


    data DocumentEvent where
      DocumentEvent :: DocumentEventType -> Range -> Maybe [String] -> Maybe String -> Maybe String -> DocumentEvent


    data DocumentEventType where
      InsertLines :: DocumentEventType
      InsertText :: DocumentEventType
      RemoveLines :: DocumentEventType
      RemoveText :: DocumentEventType


    data EAce :: !


    data EditSession


    data Editor


    data NewlineMode where
      Windows :: NewlineMode
      Unix :: NewlineMode
      Auto :: NewlineMode


    data PasteEvent


    type Position = { column :: Number, row :: Number }


    data Range


    data RangeList


    data Rules


    data ScrollBar


    data Search


    type SearchOptions = { skipCurrent :: Boolean, regExp :: Boolean, wholeWord :: Boolean, caseSensitive :: Boolean, wrap :: Boolean, backwards :: Boolean, needle :: String }


    data Selection


    data TextMode


    type TokenInfo = { value :: String }


    data TokenIterator


    data Tokenizer


    data UndoManager


    data VirtualRenderer


### Type Class Instances


    instance documentEventIsForeign :: IsForeign DocumentEvent


### Values


    readDocumentEventType :: String -> DocumentEventType


    readNewlineMode :: String -> NewlineMode


    showDocumentEventType :: DocumentEventType -> String


    showNewlineMode :: NewlineMode -> String


## Module Ace.UndoManager

### Values


    create :: forall eff. Eff (ace :: EAce | eff) UndoManager


    hasRedo :: forall eff. UndoManager -> Eff (ace :: EAce | eff) Boolean


    hasUndo :: forall eff. UndoManager -> Eff (ace :: EAce | eff) Boolean


    redo :: forall eff. Boolean -> UndoManager -> Eff (ace :: EAce | eff) Unit


    reset :: forall eff. UndoManager -> Eff (ace :: EAce | eff) Unit


    undo :: forall eff. Maybe Boolean -> UndoManager -> Eff (ace :: EAce | eff) Range


## Module Ace.VirtualRenderer

### Values


    addGutterDecoration :: forall eff. VirtualRenderer -> Eff (ace :: EAce | eff) Unit


    adjustWrapLimit :: forall eff. VirtualRenderer -> Eff (ace :: EAce | eff) Unit


    create :: forall eff. DOM.Node -> Maybe String -> Eff (ace :: EAce | eff) VirtualRenderer


    destroy :: forall eff. VirtualRenderer -> Eff (ace :: EAce | eff) Unit


    getAnimatedScroll :: forall eff. VirtualRenderer -> Eff (ace :: EAce | eff) Boolean


    getCharacterWidth :: forall eff. VirtualRenderer -> Eff (ace :: EAce | eff) Number


    getContainerElement :: forall eff. VirtualRenderer -> Eff (ace :: EAce | eff) DOM.Node


    getFirstFullyVisibleRow :: forall eff. VirtualRenderer -> Eff (ace :: EAce | eff) Number


    getFirstVisibleRow :: forall eff. VirtualRenderer -> Eff (ace :: EAce | eff) Number


    getHScrollBarAlwaysVisible :: forall eff. VirtualRenderer -> Eff (ace :: EAce | eff) Boolean


    getLastFullyVisibleRow :: forall eff. VirtualRenderer -> Eff (ace :: EAce | eff) Number


    getLastVisibleRow :: forall eff. VirtualRenderer -> Eff (ace :: EAce | eff) Number


    getMouseEventTarget :: forall eff. VirtualRenderer -> Eff (ace :: EAce | eff) DOM.Node


    getPrintMarginColumn :: forall eff. VirtualRenderer -> Eff (ace :: EAce | eff) Boolean


    getScrollBottomRow :: forall eff. VirtualRenderer -> Eff (ace :: EAce | eff) Number


    getScrollLeft :: forall eff. VirtualRenderer -> Eff (ace :: EAce | eff) Number


    getScrollTop :: forall eff. VirtualRenderer -> Eff (ace :: EAce | eff) Number


    getScrollTopRow :: forall eff. VirtualRenderer -> Eff (ace :: EAce | eff) Number


    getShowGutter :: forall eff. VirtualRenderer -> Eff (ace :: EAce | eff) Boolean


    getShowInvisibles :: forall eff. VirtualRenderer -> Eff (ace :: EAce | eff) Boolean


    getShowPrintMargin :: forall eff. VirtualRenderer -> Eff (ace :: EAce | eff) Boolean


    getTextAreaContainer :: forall eff. VirtualRenderer -> Eff (ace :: EAce | eff) DOM.Node


    getTheme :: forall eff. VirtualRenderer -> Eff (ace :: EAce | eff) String


    hideComposition :: forall eff. VirtualRenderer -> Eff (ace :: EAce | eff) Unit


    hideCursor :: forall eff. VirtualRenderer -> Eff (ace :: EAce | eff) Unit


    isScrollableBy :: forall eff. Number -> Number -> VirtualRenderer -> Eff (ace :: EAce | eff) Boolean


    onResize :: forall eff. Boolean -> Number -> Number -> Number -> VirtualRenderer -> Eff (ace :: EAce | eff) Unit


    removeGutterDecoration :: forall eff. VirtualRenderer -> Eff (ace :: EAce | eff) Unit


    screenToTextCoordinates :: forall eff. Number -> Number -> VirtualRenderer -> Eff (ace :: EAce | eff) Unit


    scrollBy :: forall eff. Number -> Number -> VirtualRenderer -> Eff (ace :: EAce | eff) Unit


    scrollCursorIntoView :: forall eff. VirtualRenderer -> Eff (ace :: EAce | eff) Unit


    scrollToLine :: forall eff. Number -> Boolean -> Boolean -> Eff (ace :: EAce | eff) Unit -> VirtualRenderer -> Eff (ace :: EAce | eff) Unit


    scrollToRow :: forall eff. Number -> VirtualRenderer -> Eff (ace :: EAce | eff) Unit


    scrollToX :: forall eff. Number -> VirtualRenderer -> Eff (ace :: EAce | eff) Number


    scrollToY :: forall eff. Number -> VirtualRenderer -> Eff (ace :: EAce | eff) Number


    setAnimatedScroll :: forall eff. Boolean -> VirtualRenderer -> Eff (ace :: EAce | eff) Unit


    setAnnotations :: forall eff. [Annotation] -> VirtualRenderer -> Eff (ace :: EAce | eff) Unit


    setCompositionText :: forall eff. String -> VirtualRenderer -> Eff (ace :: EAce | eff) Unit


    setHScrollBarAlwaysVisible :: forall eff. Boolean -> VirtualRenderer -> Eff (ace :: EAce | eff) Unit


    setPadding :: forall eff. Number -> VirtualRenderer -> Eff (ace :: EAce | eff) Unit


    setPrintMarginColumn :: forall eff. Boolean -> VirtualRenderer -> Eff (ace :: EAce | eff) Unit


    setSession :: forall eff. EditSession -> VirtualRenderer -> Eff (ace :: EAce | eff) Unit


    setShowGutter :: forall eff. Boolean -> VirtualRenderer -> Eff (ace :: EAce | eff) Unit


    setShowInvisibles :: forall eff. Boolean -> VirtualRenderer -> Eff (ace :: EAce | eff) Unit


    setShowPrintMargin :: forall eff. Boolean -> VirtualRenderer -> Eff (ace :: EAce | eff) Unit


    setStyle :: forall eff. String -> VirtualRenderer -> Eff (ace :: EAce | eff) Unit


    setTheme :: forall eff. String -> VirtualRenderer -> Eff (ace :: EAce | eff) Unit


    showComposition :: forall eff. Number -> VirtualRenderer -> Eff (ace :: EAce | eff) Unit


    showCursor :: forall eff. VirtualRenderer -> Eff (ace :: EAce | eff) Unit


    textToScreenCoordinates :: forall eff. Number -> Number -> VirtualRenderer -> Eff (ace :: EAce | eff) Position


    unsetStyle :: forall eff. String -> VirtualRenderer -> Eff (ace :: EAce | eff) Unit


    updateBackMarkers :: forall eff. VirtualRenderer -> Eff (ace :: EAce | eff) Unit


    updateBreakpoints :: forall eff. VirtualRenderer -> Eff (ace :: EAce | eff) Unit


    updateCursor :: forall eff. VirtualRenderer -> Eff (ace :: EAce | eff) Unit


    updateFontSize :: forall eff. VirtualRenderer -> Eff (ace :: EAce | eff) Unit


    updateFrontMarkers :: forall eff. VirtualRenderer -> Eff (ace :: EAce | eff) Unit


    updateFull :: forall eff. Boolean -> VirtualRenderer -> Eff (ace :: EAce | eff) Unit


    updateLines :: forall eff. Number -> Number -> VirtualRenderer -> Eff (ace :: EAce | eff) Unit


    updateText :: forall eff. VirtualRenderer -> Eff (ace :: EAce | eff) Unit


    visualizeBlur :: forall eff. VirtualRenderer -> Eff (ace :: EAce | eff) Unit


    visualizeFocus :: forall eff. VirtualRenderer -> Eff (ace :: EAce | eff) Unit



