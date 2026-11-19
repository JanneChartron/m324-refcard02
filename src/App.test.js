import { render, screen } from '@testing-library/react';
import App from './App';

test('renders the title', () => {
  render(<App />);
  expect(screen.getByText(/App Ref\. Card 02/i)).toBeInTheDocument();
});

test('renders the status message', () => {
  render(<App />);
  expect(screen.getByText(/react app \.\.\. up and running/i)).toBeInTheDocument();
});
