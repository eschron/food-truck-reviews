import React from 'react';

const ReviewForm = props => {

  return (
    <form className="callout" onSubmit={props.handleSubmit}>
      <label>
        Rating
        <ReactRadioButtonGroup
          options={[1, 2, 3, 4, 5]}
          name='rating'
          isStateful={true}
          value={null}
          onChange={props.handleRatingChange}
          fireOnMount={false}
        />
      </label>
      <div className="button-group">
        <button className="button" onClick={props.handleClearForm}>Clear</button>
        <input className="button" type="submit" value="Submit" />
      </div>
    </form>
  );
}

export default ReviewForm;
