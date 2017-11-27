export function getLocation() {
  return (dispatch) => {
    dispatch(gettingLocation())
    if (navigator.geolocation) {
        navigator.geolocation.getCurrentPosition((position) => {
          dispatch(setLocation(position))
        }//add location error handling after comma
      )
    } else {
      console.log('geolocation error')
    }

  }
}

export function gettingLocation() {
  return {
    type: "GETTING_LOCATION"
  }
}
export function setLocation(locationData) {
  return {
    type: "SET_LOCATION",
    payload: {latitude: locationData.coords.latitude, longitude: locationData.coords.longitude, }
  }
}
export function rewindLocationState(stateIndex) {
  return {
    type: "REWIND_LOCATION",
    payload: stateIndex
  }
}
