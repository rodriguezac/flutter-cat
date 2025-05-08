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

  bool showCat = false;

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

    final catFrasesByMonth = {
      1: 'Eres un michi feliz. El año empieza con maullidos optimistas.',
      2: 'Romántico... pero te comes las flores. Nivel: michi de novela.',
      3: 'Te escondes en cajas y reapareces como si nada. Místico.',
      4: 'Tu hobby: tumbar vasos y mirar a los humanos a los ojos.',
      5: 'Duermes más de lo que vive un humano promedio. Legendario.',
      6: 'Te bañas con la lengua y juzgas desde la ventana.',
      7: 'El calor no te afecta. Solo duermes con estilo extra derretido.',
      8: 'Tu energía es de gremlin. Miau a las 3:00AM garantizado.',
      9: 'Michi de clase: filósofo. Te quedas viendo la pared 20 minutos.',
      10: 'Te escondes, acechas y corres. Eres un susto peludo.',
      11: 'Eres un michi batman. Guardián nocturno de las croquetas.',
      12: 'Gato gordo navideño. Comes, destruyes el árbol y repites.',
    };

    final selectedCatImage =
        catImagesByMonth[selectedMonth] ?? 'assets/images/default.jpeg';
    final selectedFrase = catFrasesByMonth[selectedMonth] ?? 'Michi misterioso. Sin archivo, sin pasado, solo miau.';

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
                    if (newSelectedDate != null) {
                      final onlyStart = newSelectedDate.start.startOfDay;
                      safeSetState(() {
                        _model.calendarSelectedDay = DateTimeRange(
                          start: onlyStart,
                          end: onlyStart,
                        );
                        showCat = false;
                      });
                    }
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
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: SizedBox(
                width: double.infinity,
                height: 40,
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      showCat = true;
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).primaryColor,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                  ),
                  child: const Text(
                    'Confirmar michi',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ),
            if (showCat) ...[
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Image.asset(
                  selectedCatImage,
                  height: 200,
                  fit: BoxFit.contain,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Text(
                  selectedFrase,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    color: FlutterFlowTheme.of(context).primaryText,
                  ),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
