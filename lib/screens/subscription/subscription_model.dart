class AppSubscriptionTypes {
  int? _id;
  String? _title;
  int? _sorting;
  String? _description;
  String? _createdAt;
  int? _createdBy;
  int? _status;
  String? _amount;
  int? _monthlyInterval;
  String? _uniqname;
  String? _stripePlanId;

  AppSubscriptionTypes(
      {int? id,
        String? title,
        int? sorting,
        String? description,
        String? createdAt,
        int? createdBy,
        int? status,
        String? amount,
        int? monthlyInterval,
        String? uniqname,
        String? stripePlanId}) {
    if (id != null) {
      this._id = id;
    }
    if (title != null) {
      this._title = title;
    }
    if (sorting != null) {
      this._sorting = sorting;
    }
    if (description != null) {
      this._description = description;
    }
    if (createdAt != null) {
      this._createdAt = createdAt;
    }
    if (createdBy != null) {
      this._createdBy = createdBy;
    }
    if (status != null) {
      this._status = status;
    }
    if (amount != null) {
      this._amount = amount;
    }
    if (monthlyInterval != null) {
      this._monthlyInterval = monthlyInterval;
    }
    if (uniqname != null) {
      this._uniqname = uniqname;
    }
    if (stripePlanId != null) {
      this._stripePlanId = stripePlanId;
    }
  }

  int? get id => _id;
  set id(int? id) => _id = id;
  String? get title => _title;
  set title(String? title) => _title = title;
  int? get sorting => _sorting;
  set sorting(int? sorting) => _sorting = sorting;
  String? get description => _description;
  set description(String? description) => _description = description;
  String? get createdAt => _createdAt;
  set createdAt(String? createdAt) => _createdAt = createdAt;
  int? get createdBy => _createdBy;
  set createdBy(int? createdBy) => _createdBy = createdBy;
  int? get status => _status;
  set status(int? status) => _status = status;
  String? get amount => _amount;
  set amount(String? amount) => _amount = amount;
  int? get monthlyInterval => _monthlyInterval;
  set monthlyInterval(int? monthlyInterval) =>
      _monthlyInterval = monthlyInterval;
  String? get uniqname => _uniqname;
  set uniqname(String? uniqname) => _uniqname = uniqname;
  String? get stripePlanId => _stripePlanId;
  set stripePlanId(String? stripePlanId) => _stripePlanId = stripePlanId;

  AppSubscriptionTypes.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _title = json['title'];
    _sorting = json['sorting'];
    _description = json['description'];
    _createdAt = json['createdAt'];
    _createdBy = json['createdBy'];
    _status = json['status'];
    _amount = json['amount'];
    _monthlyInterval = json['monthlyInterval'];
    _uniqname = json['uniqname'];
    _stripePlanId = json['stripePlanId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['title'] = this._title;
    data['sorting'] = this._sorting;
    data['description'] = this._description;
    data['createdAt'] = this._createdAt;
    data['createdBy'] = this._createdBy;
    data['status'] = this._status;
    data['amount'] = this._amount;
    data['monthlyInterval'] = this._monthlyInterval;
    data['uniqname'] = this._uniqname;
    data['stripePlanId'] = this._stripePlanId;
    return data;
  }
}