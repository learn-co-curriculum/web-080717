export default function usersReducer(state = { username: null, loading: false, errorMessage: null, loggedIn: false }, action) {
  //TODO: fill this bad boy out
  switch (action.type) {
    case "GETTING_USER":
      return {...state, loading: true}
    case "LOGIN_USER":
      localStorage.setItem('jwt', action.payload.jwt)
      return {...state, username: action.payload.username, errorMessage: null, loading: false, loggedIn: true}
    case "LOGIN_ERROR":
      return {...state, errorMessage: action.payload.message, loading: false, loggedIn: false}
    case "SET_CURRENT_USER":
      return {...state, username: action.payload.username, errorMessage: action.payload.message, loading: false, loggedIn: true}
    case "LOG_OUT_USER":
      return {...state, username: null, errorMessage: null, loading: false, loggedIn: false}
    default:
      return state
  }
}
