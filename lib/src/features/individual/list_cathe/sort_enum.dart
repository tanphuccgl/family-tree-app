enum SortEnum {
  stt,
  familycode,
  name,
  food,
  style,
  area,
  father,
  mother,
  sex,
  date,
  weight,
  age,
  price,
  color,
  type,
  createDate,
  createUpdate;

  String getTitle(SortEnum value) {
    switch (value) {
      case SortEnum.stt:
        return 'Số thứ tự';
      case SortEnum.familycode:
        return 'Mã gia đình';
      case SortEnum.name:
        return 'Tên';
      case SortEnum.food:
        return 'Thức ăn';
      case SortEnum.style:
        return 'Phong cách';
      case SortEnum.area:
        return 'xuất xứ';
      case SortEnum.father:
        return 'Cha';
      case SortEnum.mother:
        return 'Mẹ';
      case SortEnum.sex:
        return 'Giới tính';
      case SortEnum.date:
        return 'Ngày';
      case SortEnum.weight:
        return 'Cân nặng';
      case SortEnum.age:
        return 'Tuổi';
      case SortEnum.price:
        return 'Giá';
      case SortEnum.color:
        return 'Màu sắc';
      case SortEnum.type:
        return 'Loại';
      case SortEnum.createDate:
        return 'Ngày tạo';
      case SortEnum.createUpdate:
        return 'Ngày cập nhật';
    }
  }
}
