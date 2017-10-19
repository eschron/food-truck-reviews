import React from 'react';
import { Router, browserHistory, Route, IndexRoute } from 'react-router';
import ReviewSubmissionContainer from './containers/ReviewSubmissionContainer'

const App = props => {
  return(
    <Router history={browserHistory}>
      <Route path="trucks/:id" component = {ReviewSubmissionContainer} />
    </Router>
  )
}

export default App;
