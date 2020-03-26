import 'dart:convert';

UserModel userModelFromJson(String str) {
  final jsonData = json.decode(str);
  return UserModel.fromJson(jsonData);
}

String userModelToJson(UserModel data) {
  final dyn = data.toJson();
  return json.encode(dyn);
}

class UserModel {
  int id;
  String username;
  String email;
  String provider;
  bool confirmed;
  bool blocked;
  Role role;
  String createdAt;
  String updatedAt;
  List<dynamic> budgets;
  List<dynamic> entries;
  List<BudgetCategory> budgetCategories;

  UserModel({
    this.id,
    this.username,
    this.email,
    this.provider,
    this.confirmed,
    this.blocked,
    this.role,
    this.createdAt,
    this.updatedAt,
    this.budgets,
    this.entries,
    this.budgetCategories,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => new UserModel(
    id: json["id"],
    username: json["username"],
    email: json["email"],
    provider: json["provider"],
    confirmed: json["confirmed"],
    blocked: json["blocked"],
    role: Role.fromJson(json["role"]),
    createdAt: json["created_at"],
    updatedAt: json["updated_at"],
    budgets: new List<dynamic>.from(json["budgets"].map((x) => x)),
    entries: new List<dynamic>.from(json["entries"].map((x) => x)),
    budgetCategories: new List<BudgetCategory>.from(json["budget_categories"].map((x) => BudgetCategory.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "username": username,
    "email": email,
    "provider": provider,
    "confirmed": confirmed,
    "blocked": blocked,
    "role": role.toJson(),
    "created_at": createdAt,
    "updated_at": updatedAt,
    "budgets": new List<dynamic>.from(budgets.map((x) => x)),
    "entries": new List<dynamic>.from(entries.map((x) => x)),
    "budget_categories": new List<dynamic>.from(budgetCategories.map((x) => x.toJson())),
  };
}

class BudgetCategory {
  int id;
  bool canRemove;
  String color;
  String icon;
  String name;
  String createdAt;
  String updatedAt;
  int budgetCategoryGroup;
  int user;

  BudgetCategory({
    this.id,
    this.canRemove,
    this.color,
    this.icon,
    this.name,
    this.createdAt,
    this.updatedAt,
    this.budgetCategoryGroup,
    this.user,
  });

  factory BudgetCategory.fromJson(Map<String, dynamic> json) => new BudgetCategory(
    id: json["id"],
    canRemove: json["canRemove"],
    color: json["color"],
    icon: json["icon"],
    name: json["name"],
    createdAt: json["created_at"],
    updatedAt: json["updated_at"],
    budgetCategoryGroup: json["budget_category_group"],
    user: json["user"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "canRemove": canRemove,
    "color": color,
    "icon": icon,
    "name": name,
    "created_at": createdAt,
    "updated_at": updatedAt,
    "budget_category_group": budgetCategoryGroup,
    "user": user,
  };
}

class Role {
  int id;
  String name;
  String description;
  String type;

  Role({
    this.id,
    this.name,
    this.description,
    this.type,
  });

  factory Role.fromJson(Map<String, dynamic> json) => new Role(
    id: json["id"],
    name: json["name"],
    description: json["description"],
    type: json["type"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "description": description,
    "type": type,
  };
}
