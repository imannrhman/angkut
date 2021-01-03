class Constant {
    static String appName = 'Angkut';

    static const String LOGIN_PREFERENCE = 'login';
    static const String FIRST_LAUNCH = 'first_launch';

    static List<_ItemStop> listStops = [
        _ItemStop("Cipatik - Tg. Lega","15:10 WIB"),
        _ItemStop("Sd. Serang - Caringin","15:25 WIB"),
    ];
}

class _ItemStop {
    final String route;
    final String time;

  _ItemStop(this.route, this.time);
}