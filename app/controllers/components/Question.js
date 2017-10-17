import React, { Component } from 'react';

class Question extends Component{

  constructor(props) {
    super(props);

    this.state = {
      input: {}
    }
  }

  render(){
    return(
      <div>
        <p>{this.props.category}</p>
        <p>{this.props.body}</p>

        <form>
          <label htmlFor="input" value="Submit a new question!" />
          <input
            id="new-question"
            type="text"
            value=""
            // onChange={props.handleChange}
          />
          <input type="submit" />
        </form>
      </div>
    )
  }
}


export default Question;
