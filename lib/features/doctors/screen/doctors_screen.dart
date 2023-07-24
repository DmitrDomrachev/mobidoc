import 'package:auto_route/auto_route.dart';
import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:mobidoc/api/data/doctor/doctor.dart';
import 'package:mobidoc/api/data/result.dart';
import 'package:mobidoc/features/common/widgets/base_widgets/full_width_filled_button.dart';
import 'package:mobidoc/features/doctors/screen/doctors_screen_wm.dart';
import 'package:mobidoc/features/doctors/widgets/doctor_card.dart';
import 'package:mobidoc/features/navigation/domain/entity/app_route_names.dart';

/// Main widget for DoctorsScreen module.
@RoutePage(name: AppRouteNames.doctorsScreen)
class DoctorsScreen extends ElementaryWidget<IDoctorsScreenWidgetModel> {
  /// Create an instance [DoctorsScreen].
  const DoctorsScreen({
    Key? key,
    WidgetModelFactory wmFactory = defaultDoctorsScreenWidgetModelFactory,
  }) : super(wmFactory, key: key);

  @override
  Widget build(IDoctorsScreenWidgetModel wm) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: wm.colorScheme.background,
        foregroundColor: wm.colorScheme.onBackground,
        centerTitle: false,
        title: Text('Доктора', style: wm.textScheme.bold30),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: ListView(
          children: [
            StateNotifierBuilder(
              listenableState: wm.doctors,
              builder: (_, doctors) {
                final data = doctors as Result<List<Doctor>>;
                return switch (data) {
                  Loading() => const Center(
                      child: CircularProgressIndicator(),
                    ),
                  Success() => _DoctorList(
                      doctors: data.value,
                    ),
                  Error() => FullWidthFilledButton(
                      child: const Text('Перезагрузить'),
                      onPressed: () {
                        wm.loadDoctors();
                      },
                    )
                };
              },
            ),
          ],
        ),
      ),
    );
  }
}

class _DoctorList extends StatelessWidget {
  const _DoctorList({required this.doctors});

  final List<Doctor> doctors;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ...doctors.map(
          (e) => Padding(
            padding: const EdgeInsets.only(bottom: 14.0),
            child: DoctorCard(
              name: e.name,
              type: e.speciality,
              info: e.bio,
              photo: e.photo,
            ),
          ),
        ),
      ],
    );
  }
}
