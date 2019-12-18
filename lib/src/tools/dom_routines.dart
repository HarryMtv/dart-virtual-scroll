import 'dart:html';

import 'dart:math';

num getScrollPosition(final HtmlElement element, final bool isHorizontal) =>
    isHorizontal ? element.scrollLeft : element.scrollTop;

void setScrollPosition(final HtmlElement element, final num value, final bool isHorizontal) {
  final sanitizedValue = max(0, value);

  if(isHorizontal) {
    element.scrollLeft = sanitizedValue;
  } else {
    element.scrollTop = sanitizedValue;
  }
}

Rectangle<num> getParams(final HtmlElement element) {
  if (element.tagName.toLowerCase() == 'body') {
    return element.parent.client;
  } else {
    return element.getBoundingClientRect();
  }
}

num getElementSize(final HtmlElement element, final bool isHorizontal) =>
    isHorizontal ? getParams(element).width : getParams(element).height;

num getSizeStyle(final HtmlElement element, final bool isHorizontal) {
  final size = isHorizontal ? element.style.width : element.style.height;

  return num.tryParse(size) ?? 0;
}

void setSizeStyle(final HtmlElement element, final num value, final bool isHorizontal) {
  final sanitizedValue = max(0, value);

  if(isHorizontal) {
    element.style.width = '${sanitizedValue}px';
  } else {
    element.style.height = '${sanitizedValue}px';
  }
}

num getOffset(final HtmlElement element, final bool isHorizontal) =>
    isHorizontal ? element.offsetLeft : element.offsetTop;

void hideElement(final HtmlElement element) => element.style.display = 'none';


