import React from 'react';
import ReviewList from '../../src/components/ReviewList';

describe('ReviewList', () => {
  let wrapper;
  let reviews = [
    {
      rating: 5,
      description: 'the description'
    }
  ]

  beforeEach(() => {
    jasmineEnzyme();
    wrapper = mount(<ReviewList reviews={reviews}/>);
  });

  it('should render a heading', () => {
    expect(wrapper.find('h4').text()).toEqual('Reviews');
  });

  it('should render the reviews', () => {
    expect(wrapper.find('ul').length).toEqual(1);
  });
})
