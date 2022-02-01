// correct URLs depending on ENV user is currently on

const prod = {
  url: {
    API_URL: 'https://gaec-mouton.herokuapp.com',
    API_URL_USERS: 'https://gaec-mouton.herokuapp.com/users',
    API_URL_CREATE_CORNER_POSITIONS: 'https://gaec-mouton.herokuapp.com/corner_positions'
  }
};

const dev = {
  url: {
    API_URL: 'http://localhost:3000',
    API_URL_CREATE_CORNER_POSITIONS: 'http://localhost:3000/corner_positions'
  }
};

export const config = process.env.NODE_ENV === 'development' ?dev: prod;
