import '/components/appbar/appbar_widget.dart';
import '/flutter_flow/flutter_flow_calendar.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'date_picker_model.dart';
export 'date_picker_model.dart';

class DatePickerWidget extends StatefulWidget {
  const DatePickerWidget({super.key});

  static String routeName = 'DatePicker';
  static String routePath = '/datePicker';

  @override
  State<DatePickerWidget> createState() => _DatePickerWidgetState();
}

class _DatePickerWidgetState extends State<DatePickerWidget> {
  late DatePickerModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DatePickerModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final selectedMonth =
        _model.calendarSelectedDay?.start.month ?? DateTime.now().month;

    final catImagesByMonth = {
      1: 'assets/images/enero.jpeg',
      2: 'assets/images/febrero.jpeg',
      3: 'assets/images/marzo.jpeg',
      4: 'assets/images/abril.jpeg',
      5: 'assets/images/mayo.jpeg',
      6: 'assets/images/junio.jpeg',
      7: 'assets/images/julio.jpeg',
      8: 'assets/images/agosto.jpeg',
      9: 'assets/images/septiembre.jpeg',
      10: 'assets/images/octubre.jpeg',
      11: 'assets/images/noviembre.jpeg',
      12: 'assets/images/diciembre.jpeg',
    };

    final selectedCatImage =
        catImagesByMonth[selectedMonth] ?? 'assets/images/default.jpeg';

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        body: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            wrapWithModel(
              model: _model.appbarModel,
              updateCallback: () => safeSetState(() {}),
              child: AppbarWidget(
                title: 'Date Picker',
              ),
            ),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).secondaryBackground,
                boxShadow: [
                  BoxShadow(
                    blurRadius: 3.0,
                    color: Color(0x33000000),
                    offset: Offset(0.0, 1.0),
                  )
                ],
              ),
              child: Padding(
                padding: EdgeInsets.all(18.0),
                child: FlutterFlowCalendar(
                  color: FlutterFlowTheme.of(context).primary,
                  iconColor: FlutterFlowTheme.of(context).secondaryText,
                  weekFormat: false,
                  weekStartsMonday: false,
                  rowHeight: 48.0,
                  onChange: (DateTimeRange? newSelectedDate) {
                    safeSetState(() =>
                        _model.calendarSelectedDay = newSelectedDate);
                  },
                  titleStyle: FlutterFlowTheme.of(context).titleLarge.override(
                        fontFamily: 'SF UI Text',
                        letterSpacing: 0.0,
                      ),
                  dayOfWeekStyle:
                      FlutterFlowTheme.of(context).bodyLarge.override(
                            fontFamily: 'SF UI Text',
                            letterSpacing: 0.0,
                          ),
                  dateStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'SF UI Text',
                        letterSpacing: 0.0,
                      ),
                  selectedDateStyle:
                      FlutterFlowTheme.of(context).titleSmall.override(
                            fontFamily: 'SF UI Text',
                            letterSpacing: 0.0,
                          ),
                  inactiveDateStyle:
                      FlutterFlowTheme.of(context).labelMedium.override(
                            fontFamily: 'SF UI Text',
                            letterSpacing: 0.0,
                          ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Image.asset(
                selectedCatImage,
                height: 200,
                fit: BoxFit.contain,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
