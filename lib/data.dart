class DataGenerator {
  List<Plan> planList = [];

  List<Plan> getAllPlans() {
    return planList;
  }

  getPlan(id) {
    return planList.where((plan) => plan.id == id);
  }

  addPlan(String name, String description) {
    planList.add(new Plan(name, description));
  }

  updatePlan(String name, String description, int index) {
    planList[index].name = name;
    planList[index].description = description;
  }

  deletePlan(int index) {
    planList.removeAt(index);
  }

  setupScenario() {
    for (int i = 0; i < 10; i++) {
      this.addPlan('plan ' + (i + 1).toString(),
          'Description of plan ' + (i + 1).toString());
    }
  }
}

class Plan {
  late String id;
  late String name;
  late String description;

  Plan(String name, String description) {
    this.id = currentKey.toString();
    currentKey++;
    this.name = name;
    this.description = description;
  }
}

int currentKey = 0;
