import Immutable, { List, fromJS } from "immutable";

export const initialState = fromJS({
  stores: [],
  loadingStores: null
});

export default function locationReducer(state = initialState, action) {
  switch (action.type) {
    case "GETTING_STORES":
      return state.set("loadingStores", true);
    case "SET_STORES":
      return state.set("loadingStores", false).set("stores", action.payload);
    default:
      return state;
  }
}
