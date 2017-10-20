import React from 'react';
import Reviews from '../../src/components/Reviews';

describe('Reviews', () => {
  let wrapper;
  let reviews = [
    {
      rating: 5,
      description: 'the description'
    }
  ]

  beforeEach(() => {
    jasmineEnzyme();
    wrapper = mount(<Reviews reviews={reviews}/>);
  });

  it('should render a heading', () => {
    expect(wrapper.find('h4').text()).toEqual('Reviews');
  });

  it('should render the reviews', () => {
    expect(wrapper.find('ul').length).toEqual(1);
    expect(wrapper.find('li').at(0).text()).toEqual('Rating: 5');
    expect(wrapper.find('li').at(1).text()).toEqual('Description: the description');
  });
})
