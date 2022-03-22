import ace from "ace-builds";

export function getBackgroundTokenizer(value) {
  return function () {
    return value.bgTokenizer;
  };
}

export function onImpl(event, fn, self) {
  return function () {
    return self.on(event, function (e) {
      fn(e)();
    });
  };
}

export function findMatchingBracketImpl(position, self) {
  return function () {
    return self.findMatchingBracket(position);
  };
}

export function addFoldImpl(text, range, self) {
  return function () {
    return self.addFold(text, range);
  };
}

export function screenToDocumentColumnImpl(row, column, self) {
  return function () {
    return self.screenToDocumentColumn(row, column);
  };
}

export function highlightImpl(text, self) {
  return function () {
    return self.highlight(text);
  };
}

export function setDocumentImpl(doc, self) {
  return function () {
    return self.setDocument(doc);
  };
}

export function getDocument(self) {
  return function () {
    return self.getDocument();
  };
}

export function resetRowCacheImpl(row, self) {
  return function () {
    return self.$resetRowCache(row);
  };
}

export function setValueImpl(text, self) {
  return function () {
    return self.setValue(text);
  };
}

export function setModeImpl(mode, self) {
  return function () {
    return self.setMode(mode);
  };
}

export function getValue(self) {
  return function () {
    return self.getValue();
  };
}

export function getSelection(self) {
  return function () {
    return self.getSelection();
  };
}

export function getStateImpl(row, self) {
  return function () {
    return self.getState(row);
  };
}

export function getTokensImpl(row, self) {
  return function () {
    return self.getTokens(row);
  };
}

export function getTokenAtImpl(row, column, self) {
  return function () {
    return self.getTokenAt(row, column);
  };
}

export function setUndoManagerImpl(undoManager, self) {
  return function () {
    return self.setUndoManager(undoManager);
  };
}

export function getUndoManager(self) {
  return function () {
    return self.getUndoManager();
  };
}

export function getTabString(self) {
  return function () {
    return self.getTabString();
  };
}

export function setUseSoftTabsImpl(useSoftTabs, self) {
  return function () {
    return self.setUseSoftTabs(useSoftTabs);
  };
}

export function getUseSoftTabs(self) {
  return function () {
    return self.getUseSoftTabs();
  };
}

export function setTabSizeImpl(tabSize, self) {
  return function () {
    return self.setTabSize(tabSize);
  };
}

export function getTabSize(self) {
  return function () {
    return self.getTabSize();
  };
}

export function isTabStopImpl(position, self) {
  return function () {
    return self.isTabStop(position);
  };
}

export function setOverwriteImpl(overwrite, self) {
  return function () {
    return self.setOverwrite(overwrite);
  };
}

export function getOverwrite(self) {
  return function () {
    return self.getOverwrite();
  };
}

export function toggleOverwrite(self) {
  return function () {
    return self.toggleOverwrite();
  };
}

export function addGutterDecorationImpl(row, className, self) {
  return function () {
    return self.addGutterDecoration(row, className);
  };
}

export function removeGutterDecorationImpl(row, className, self) {
  return function () {
    return self.removeGutterDecoration(row, className);
  };
}

export function getBreakpoints(self) {
  return function () {
    return self.getBreakpoints();
  };
}

export function setBreakpointsImpl(rows, self) {
  return function () {
    return self.setBreakpoints(rows);
  };
}

export function clearBreakpoints(self) {
  return function () {
    return self.clearBreakpoints();
  };
}

export function setBreakpointImpl(row, className, self) {
  return function () {
    return self.setBreakpoint(row, className);
  };
}

export function clearBreakpointImpl(row, self) {
  return function () {
    return self.clearBreakpoint(row);
  };
}

export function addMarkerImpl(range, clazz, type, inFront, self) {
  return function () {
    return self.addMarker(range, clazz, type, inFront);
  };
}

export function addDynamicMarkerImpl(marker, inFront, self) {
  return function () {
    return self.addDynamicMarker({
      update: function (html, layer) {
        marker(html)(layer.element)();
      }
    }, inFront);
  };
}

export function removeMarkerImpl(markerId, self) {
  return function () {
    return self.removeMarker(markerId);
  };
}

export function setAnnotationsImpl(annotations, self) {
  return function () {
    return self.setAnnotations(annotations);
  };
}

export function getAnnotations(self) {
  return function () {
    return self.getAnnotations();
  };
}

export function clearAnnotations(self) {
  return function () {
    return self.clearAnnotations();
  };
}

export function detectNewLineImpl(text, self) {
  return function () {
    return self.$detectNewLine(text);
  };
}

export function getWordRangeImpl(row, column, self) {
  return function () {
    return self.getWordRange(row, column);
  };
}

export function getAWordRangeImpl(row, column, self) {
  return function () {
    return self.getAWordRange(row, column);
  };
}

export function setNewLineModeImpl(newLineMode, self) {
  return function () {
    return self.setNewLineMode(newLineMode);
  };
}

export function getNewLineMode(self) {
  return function () {
    return self.getNewLineMode();
  };
}

export function setUseWorkerImpl(useWorker, self) {
  return function () {
    return self.setUseWorker(useWorker);
  };
}

export function getUseWorker(self) {
  return function () {
    return self.getUseWorker();
  };
}

export function onReloadTokenizer(self) {
  return function () {
    return self.onReloadTokenizer();
  };
}

export function modeImpl(mode, self) {
  return function () {
    return self.$mode(mode);
  };
}

export function getMode(self) {
  return function () {
    return self.getMode();
  };
}

export function setScrollTopImpl(scrollTop, self) {
  return function () {
    return self.setScrollTop(scrollTop);
  };
}

export function getScrollTop(self) {
  return function () {
    return self.getScrollTop();
  };
}

export function setScrollLeftImpl(scrollLeft, self) {
  return function () {
    return self.setScrollLeft(scrollLeft);
  };
}

export function getScrollLeft(self) {
  return function () {
    return self.getScrollLeft();
  };
}

export function getScreenWidth(self) {
  return function () {
    return self.getScreenWidth();
  };
}

export function getLineImpl(row, self) {
  return function () {
    return self.getLine(row);
  };
}

export function getLinesImpl(firstRow, lastRow, self) {
  return function () {
    return self.getLines(firstRow, lastRow);
  };
}

export function getLength(self) {
  return function () {
    return self.getLength();
  };
}

export function getTextRangeImpl(range, self) {
  return function () {
    return self.getTextRange(range);
  };
}

export function insertImpl(position, text, self) {
  return function () {
    return self.insert(position, text);
  };
}

export function removeImpl(range, self) {
  return function () {
    return self.remove(range);
  };
}

export function setUndoSelectImpl(enable, self) {
  return function () {
    return self.setUndoSelect(enable);
  };
}

export function replaceImpl(range, text, self) {
  return function () {
    return self.replace(range, text);
  };
}

export function moveTextImpl(fromRange, toPosition, self) {
  return function () {
    return self.moveText(fromRange, toPosition);
  };
}

export function indentRowsImpl(startRow, endRow, indentString, self) {
  return function () {
    return self.indentRows(startRow, endRow, indentString);
  };
}

export function outdentRowsImpl(range, self) {
  return function () {
    return self.outdentRows(range);
  };
}

export function moveLinesUpImpl(firstRow, lastRow, self) {
  return function () {
    return self.moveLinesUp(firstRow, lastRow);
  };
}

export function moveLinesDownImpl(firstRow, lastRow, self) {
  return function () {
    return self.moveLinesDown(firstRow, lastRow);
  };
}

export function duplicateLinesImpl(firstRow, lastRow, self) {
  return function () {
    return self.duplicateLines(firstRow, lastRow);
  };
}

export function setUseWrapModeImpl(useWrapMode, self) {
  return function () {
    return self.setUseWrapMode(useWrapMode);
  };
}

export function getUseWrapMode(self) {
  return function () {
    return self.getUseWrapMode();
  };
}

export function setWrapLimitRangeImpl(min, max, self) {
  return function () {
    return self.setWrapLimitRange(min, max);
  };
}

export function adjustWrapLimitImpl(desiredLimit, self) {
  return function () {
    return self.adjustWrapLimit(desiredLimit);
  };
}

export function getWrapLimit(self) {
  return function () {
    return self.getWrapLimit();
  };
}

export function getWrapLimitRange(self) {
  return function () {
    return self.getWrapLimitRange();
  };
}

export function getDisplayTokensImpl(str, offset, self) {
  return function () {
    return self.$getDisplayTokens(str, offset);
  };
}

export function getStringScreenWidthImpl(str, maxScreenColumn, screenColumn, self) {
  return function () {
    return self.$getStringScreenWidth(str, maxScreenColumn, screenColumn);
  };
}

export function getRowLengthImpl(row, self) {
  return function () {
    return self.getRowLength(row);
  };
}

export function getScreenLastRowColumnImpl(screenRow, self) {
  return function () {
    return self.getScreenLastRowColumn(screenRow);
  };
}

export function getDocumentLastRowColumnImpl(docRow, docColumn, self) {
  return function () {
    return self.getDocumentLastRowColumn(docRow, docColumn);
  };
}

export function getDocumentLastRowColumnPositionImpl(docRow, docColumn, self) {
  return function () {
    return self.getDocumentLastRowColumnPosition(docRow, docColumn);
  };
}

export function getRowSplitData(self) {
  return function () {
    return self.getRowSplitData();
  };
}

export function getScreenTabSizeImpl(screenColumn, self) {
  return function () {
    return self.getScreenTabSize(screenColumn);
  };
}

export function screenToDocumentPositionImpl(screenRow, screenColumn, self) {
  return function () {
    return self.screenToDocumentPosition(screenRow, screenColumn);
  };
}

export function documentToScreenPositionImpl(docRow, docColumn, self) {
  return function () {
    return self.documentToScreenPosition(docRow, docColumn);
  };
}

export function documentToScreenColumnImpl(row, docColumn, self) {
  return function () {
    return self.documentToScreenColumn(row, docColumn);
  };
}

export function documentToScreenRowImpl(docRow, docColumn, self) {
  return function () {
    return self.documentToScreenRow(docRow, docColumn);
  };
}

export function getScreenLength(self) {
  return function () {
    return self.getScreenLength();
  };
}

function  create(text, mode) {
  return function () {
    var EditSession = ace.require("ace/edit_session").EditSession;
    return new EditSession(text, mode);
  };
}

export {create as createWithModeImpl};
export {create as createImpl};
export {create as createFromLinesImpl};

export function getMarkers(session) {
  return function () {
    var markerObj = session.getMarkers();
    var ks = Object.getOwnPropertyNames(markerObj);
    var result = [];
    for (var i = 0; i < ks.length; i++) {
      result[i] = markerObj[ks[i]];
    }
    return result;
  };
}
