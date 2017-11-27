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
      .then(console.log);
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
