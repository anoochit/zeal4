class GridUtils {
  static int responsiveGridColumn(double width) {
    return (width < 640)
        ? 2
        : (width < 768)
            ? 3
            : (width < 1024)
                ? 4
                : (width < 1280)
                    ? 5
                    : 6;
  }
}
