import React from 'react';
import Review from '../../src/components/Review';

describe('Review', () => {
  let wrapper;

  beforeEach(() => {
    jasmineEnzyme();
    wrapper = mount(
      <Review
        id={1}
        rating={5}
        description="the description"
      />);
  });

  it('should render the review details', () => {
    expect(wrapper.find('li').at(0).text()).toEqual('Votes: 0');
    expect(wrapper.find('li').at(3).text()).toEqual('Rating: 5');
    expect(wrapper.find('li').at(4).text()).toEqual('Description: the description');
  });
})
