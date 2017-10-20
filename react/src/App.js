import React from 'react';
import { Router, browserHistory, Route, IndexRoute } from 'react-router';
import ReviewsContainer from './containers/ReviewsContainer'

const App = props => {
  return(
    <Router history={browserHistory}>
      <Route path="trucks/:id" component = {ReviewsContainer} />
    </Router>
  )
}

export default App;
