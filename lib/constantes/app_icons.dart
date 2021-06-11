part of values;



class FoodIcon {
  static IconData getIcon(String icon) {
    switch (icon.toLowerCase()) {
      case "pizza":
        return MdiIcons.pizza;
        break;
      case "plat":
        return MdiIcons.food;
        break;
      case "boisson":
        return MdiIcons.foodForkDrink;
        break;
      case "dessert":
        return MdiIcons.foodApple;
        break;
      case "cream":
        return MdiIcons.iceCream;
        break;
      default:
        return MdiIcons.hamburger;
    }
  }
}
