export function getLocation() {
  return dispatch => {
    dispatch(gettingLocation());
    if (navigator.geolocation) {
      navigator.geolocation.getCurrentPosition(
        position => {
          dispatch(setLocation(position));
          dispatch(getStores(position));
        } //add location error handling after comma
      );
    } else {
      console.log("geolocation error");
    }
  };
}

export function gettingLocation() {
  return {
    type: "GETTING_LOCATION"
  };
}
export function setLocation(locationData) {
  return {
    type: "SET_LOCATION",
    payload: {
      latitude: locationData.coords.latitude,
      longitude: locationData.coords.longitude
    }
  };
}

export function getStores(coords) {
  return dispatch => {
    dispatch(gettingStores());
    fetch("http://localhost:3000/api/v1/stores", {
      method: "POST",
      headers: {
        "Content-Type": "application/json",
        Accept: "application/json"
      },
      body: JSON.stringify({ coords })
    })
      .then(res => res.json())
      .then(json => dispatch(setStores(json)));
  };
}

export function gettingStores() {
  return {
    type: "GETTING_STORES"
  };
}
export function setStores(stores) {
  return {
    type: "SET_LOCATION",
    payload: stores
  };
}

export function loginUser(username, password) {
  return dispatch => {
    dispatch(gettingUserInfo());
    fetch("http://localhost:3000/api/v1/login", {
      method: "POST",
      headers: {
        "Content-Type": "application/json",
        Accept: "application/json"
      },
      body: JSON.stringify({ user: { username, password } })
    })
      .then(response => response.json())
      .then(userData => {
        if (userData.message) {
          dispatch(logInError(userData));
        } else {
          dispatch(loggedInUser(userData));
        }
      });
  };
}

export function signUpUser(username, password) {
  return dispatch => {
    dispatch(gettingUserInfo());
    fetch("http://localhost:3000/api/v1/signup", {
      method: "POST",
      headers: {
        "Content-Type": "application/json",
        Accept: "application/json"
      },
      body: JSON.stringify({ user: { username, password } })
    })
      .then(response => response.json())
      .then(userData => {
        if (userData.message) {
          dispatch(logInError(userData));
        } else {
          dispatch(loggedInUser(userData));
        }
      });
  };
}

export function gettingUserInfo() {
  return {
    type: "GETTING_USER"
  };
}

export function loggedInUser(userData) {
  return {
    type: "LOGIN_USER",
    payload: userData
  };
}
export function logInError(userData) {
  return {
    type: "LOGIN_ERROR",
    payload: userData
  };
}

export function getCurrentUser() {
  return dispatch => {
    dispatch(gettingUserInfo());
    fetch("http://localhost:3000/api/v1/current_user", {
      headers: {
        "Content-Type": "application/json",
        Accept: "application/json",
        Authorization: `Bearer ${localStorage.getItem("jwt")}`
      }
    })
      .then(response => response.json())
      .then(userData => dispatch(setCurrentUser(userData)));
  };
}

export function setCurrentUser(userData) {
  return {
    type: "SET_CURRENT_USER",
    payload: userData
  };
}

export function logOutUser() {
  return {
    type: "LOG_OUT_USER"
  };
}
