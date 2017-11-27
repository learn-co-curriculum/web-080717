import Immutable, { List, fromJS } from "immutable";

export const initialState = fromJS({
  latitude: 0,
  longitude: 0,
  loadingLocation: null,
  currentTime: new Date().toTimeString()
});

export default function locationReducer(state = initialState, action) {
  switch (action.type) {
    case "GETTING_LOCATION":
      return state.set("loadingLocation", true);

    case "SET_LOCATION":
      return state
        .set("latitude", action.payload.latitude)
        .set("longitude", action.payload.longitude)
        .set("currentTime", new Date().toTimeString())
        .set("loadingLocation", false);

    //
    // return {...state, latitude: action.payload.latitude, longitude: action.payload.longitude, loadingLocation: false}
    case "REWIND_LOCATION":
      return List(state).slice(0, action.payload + 1);
    default:
      return state;
  }
}
