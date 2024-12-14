enum NestedNavigation {
  dashboardScreen,
  searchPage,
}

extension NestedNavID on NestedNavigation {
  int? get navID {
    switch(this){
      case NestedNavigation.dashboardScreen:
        return 1;
      case NestedNavigation.searchPage:
        return 2;
      default:
        return null;
    }
  }
}