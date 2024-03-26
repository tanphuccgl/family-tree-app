part of "table_female_state.dart";

class TableFemaleBloc extends Cubit<TableFemaleState> {
  final String individualId;
  TableFemaleBloc(this.individualId) : super(TableFemaleState()) {
    init();
  }

  Domain get domain => GetIt.I<Domain>();

  ScrollController scrollController1 = ScrollController();
  ScrollController scrollController2 = ScrollController();

  void syncScrollController() {
    bool shouldSync = true;

    scrollController1.addListener(() {
      if (shouldSync &&
          scrollController1.position.pixels !=
              scrollController2.position.pixels) {
        scrollController2.jumpTo(scrollController1.position.pixels
            .clamp(0.0, scrollController2.position.maxScrollExtent));
      }
    });

    scrollController2.addListener(() {
      if (shouldSync &&
          scrollController2.position.pixels !=
              scrollController1.position.pixels) {
        scrollController1.jumpTo(scrollController2.position.pixels
            .clamp(0.0, scrollController1.position.maxScrollExtent));
      }
    });
  }

  Future<String?> getIndividual() async {
    final result = await domain.individual.getIndividual(individualId);

    return result.data?.name;
  }

  Future<List<IndividualModel>> getAllIndividual() async {
    XToast.showLoading();
    final result = await domain.individual.getAllIndividual();
    return result.data ?? [];
  }

  void init() async {
    XToast.showLoading();
    final name = await getIndividual();

    if (name == null) {
      XToast.error("Có lỗi xảy ra");
      XToast.hideLoading();
      return;
    }
    final list = await getAllIndividual();
    if (list.isEmpty) {
      XToast.show("Danh sách trống");
      XToast.hideLoading();
      return;
    }

    try {
      final prefix1 = Utils.getPrefix(name, "-");
      final result = list.where((element) {
        final prefix2 = Utils.getPrefix(element.name, "-");
        return prefix2 == prefix1;
      }).toList();
      emit(state.copyWith(list: result));
      XToast.hideLoading();
    } catch (e) {
      XToast.error("Tên không đúng format");
      XToast.hideLoading();
    }
    syncScrollController();
  }

  void onBackButton(BuildContext context) {
    context.router.canPop()
        ? context.router.pop()
        : context.router
            .pushAndPopUntil(FemaleIndividualsRoute(), predicate: (_) => false);
  }
}
