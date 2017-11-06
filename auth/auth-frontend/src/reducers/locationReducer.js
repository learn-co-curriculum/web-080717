export default function locationReducer(state = { latitude: null, longitude: null, loadingLocation: false }, action) {
  //TODO: fill this bad boy out
  switch (action.type) {
    case "GETTING_LOCATION":
      return {...state, loadingLocation: true}
    case "SET_LOCATION":
      return {...state, latitude: action.payload.latitude, longitude: action.payload.longitude, loadingLocation: false}
    default:
      return state
  }
}
