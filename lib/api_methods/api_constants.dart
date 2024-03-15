const String _baseUrl = 'https://indiancitymarket.com/Cricket/';

///// login
const String loginUrl = '${_baseUrl}Login?Add=null';
//////////
const String registerUrl = 'Login?Add=null';

/////// home screen

///// quiz part

const getQuizQuestionUrl = '${_baseUrl}Quiz?GET=null';
const saveQuizAnswerUrl = '${_baseUrl}Quiz?Ans=null';

////

const getALlTournamentsUrl = '${_baseUrl}Tournaments?GET=';
const getALlMatchesOfTournamentsUrl = '${_baseUrl}Match?GET=';
const pointsTableOfTournamentsUrl = '${_baseUrl}PointsTable?GET=';
const topRunOfTournamentsUrl = '${_baseUrl}TopRun?GET=';
const wicketsOfTournamentsUrl = '${_baseUrl}Wickets?GET=';
const winnerOfTournamentsUrl = '${_baseUrl}Winner?GET=';
const playingTeamsOfTournamentsUrl = '${_baseUrl}PlayingTeams?GET=';
const getBoundaryTournamentsUrl = '${_baseUrl}PlayingTeams?GET=';

////// notifications
const getALlNotificationsUrl = '${_baseUrl}Notification?GET=';
const updateNotificationsUrl = '${_baseUrl}Notification?UpdateView=';

////  profile
const getUserProfileUrl = '${_baseUrl}UserProfile?GET=';
const updateUserProfileUrl = '${_baseUrl}UserProfile?Update=';
const updateUserProfileImageUrl = '${_baseUrl}UserProfile?FILE=';

/// registration

const saveUserRegistrationDetailUrl = '${_baseUrl}UserRegistration?Add=';
const getUserRegistrationDetailUrl = '${_baseUrl}UserRegistration?GET=';
