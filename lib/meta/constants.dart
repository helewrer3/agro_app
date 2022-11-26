//Environment vars
const AUTH0_DOMAIN = 'dev-ji6lcyp5.us.auth0.com';
const AUTH0_CLIENT_ID = '9GsSRSrFDAWS4V61J0GTQuZqPeuD2HLQ';
const BUNDLE_IDENTIFIER = 'com.helewrer3.agroapp';
const WEATHER_SECRET = 'ad6ba04780c2603bc57a9fd63df4c745';
const NEWS_SECRET = '8dOvZtHaiLJfJJWhCUvMgr4gQvRLcJ5G9OC8TK8HMYA';

//Auth URLs
const AUTH0_ISSUER = 'https://$AUTH0_DOMAIN';
const AUTH0_REDIRECT_URI = '$BUNDLE_IDENTIFIER://login-callback';

//News URLs
const NEWS_PROVIDER =
    'https://api.newscatcherapi.com/v2/search?q=agriculture&countries=IN&page_size=100';

//Weather URLs
const WEATHER_PROVIDER = 'https://openweathermap.org';

//Yield URLs
const YIELD_PROVIDER = 'https://crop-yield-api.herokuapp.com';

//Secure Storage Keys
const REFRESH_TOKEN_KEY = 'refresh_token';
const NAME_KEY = 'name';
const IMAGE_KEY = 'picture';

//Paths
const LOGO_URL = 'assets/images/logo.png';
const SPLASH_ROUTE = '/';
const LOGIN_ROUTE = '/login';
const BASE_ROUTE = '/base';
const NEWS_ROUTE = '/news';
const WEATHER_ROUTE = '/weather';
const YIELD_ROUTE = '/yield';
const TOOLS_ROUTE = '/tools';
const ADD_ROUTE = '/add';

//Strings
const AGRO_APP = 'Agro App';
const TITLE = 'title';
const NAVBAR_NAME = 'navbar_name';
const NAVBAR_ICON = 'navbar_icon';
const APPBAR_COLOR = 'appbar_color';
const APPBAR_ACTIVE_ACTION_WIDGET = 'appbar_active_action_widget';
const TOOLS = 'Tools';
const DISEASE_PREDICTION = 'Disease Prediction';
const DISEASE = 'Disease';
const YIELD_PREDICTION = 'Yield Prediction';
const YIELD = 'Yield';
const NEWS = 'News';
const MARKETPLACE = 'Marketplace';
const ARTICLES = 'articles';
const DESCRIPTION = 'excerpt';
const LINK = 'link';
const WEATHER = 'Weather';
const LOCATION_SERVICES_DISABLED = 'Location services are disabled.';
const LOCATION_PERMISSION_DEINED_FOREVER =
    'Location permissions are permanently denied, we cannot request permissions.';
const LOCATION_PERMISSION_DENIED = 'Location permissions are denied';
const AVG_RAINFALL_YEARLY = 'Average Rainfall per Year';
const AIR_TEMP = 'Air Temperature';
const PESTICIDE = 'Pesticide (kg/ha)';
const CROP = 'crop';
const ERROR = 'An error occurred. Try again!';
const SEND = 'Send';
const LOGIN = 'Login';
const NONE_TEXT = '';
const PRODUCT = 'Product';
const WELCOME = 'Welcome';
const FERTILIZERS = 'Fertilizers';
const INSECTICIDES = 'Insecticides';
const PESTICIDES = 'Pesticides';
const ALL = 'All';
const ENTER_DETAILS = 'Enter Details';
const SELECT_IMAGE_SOURCE = "Select image source";
const GALLERY = "Gallery";
const CAMERA = "Camera";
const DISEASE_RECOGNITION = 'Disease Recognition';