const String _baseUrl = 'https://indiancitymarket.com/Cricket/';

///// login
const String loginUrl = '${_baseUrl}Login?Add=null';
//////////
const String registerUrl = 'Login?Add=null';

/////// home screen

const getALlTournamentsUrl = '${_baseUrl}Tournaments?GET=27';
const getALlMatchesOfTournamentsUrl = '${_baseUrl}Match?GET=27';
const pointsTableOfTournamentsUrl = '${_baseUrl}PointsTable?GET=27';
const topRunOfTournamentsUrl = '${_baseUrl}TopRun?GET=27';
const wicketsOfTournamentsUrl = '${_baseUrl}Wickets?GET=27';
const winnerOfTournamentsUrl = '${_baseUrl}Winner?GET=27';
const playingTeamsOfTournamentsUrl = '${_baseUrl}PlayingTeams?GET=27';
const getBoundaryTournamentsUrl = '${_baseUrl}PlayingTeams?GET=27';

////// notifications
const getALlNotificationsUrl = '${_baseUrl}Notification?GET=27';
const updateNotificationsUrl = '${_baseUrl}Notification?UpdateView=27';

////  profile
const getUserProfileUrl = '${_baseUrl}UserProfile?GET=27';
const updateUserProfileUrl = '${_baseUrl}UserProfile?Update=27';
const updateUserProfileImageUrl = '${_baseUrl}UserProfile?FILE=27';

/// registration

const saveUserRegistrationDetailUrl = '${_baseUrl}UserRegistration?Add=27';
const getUserRegistrationDetailUrl = '${_baseUrl}UserRegistration?GET=27';
