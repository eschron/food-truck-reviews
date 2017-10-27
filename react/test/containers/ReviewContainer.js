import React from 'react';
import ReviewContainer from '../../src/containers/ReviewContainer';

describe('ReviewContainer', () => {
  let wrapper;

  beforeEach(() => {
    jasmineEnzyme();
    wrapper = mount(
      <ReviewContainer
        id={1}
        rating={5}
        description="the description"
      />);
  });

  it('should render the review details', () => {
    expect(wrapper.find('.review-vote-count').text()).toEqual('Votes: 0');
    expect(wrapper.find('.review-rating').text()).toEqual('Rating: 5');
    expect(wrapper.find('.review-description').text()).toEqual('Description: the description');
  });
})
