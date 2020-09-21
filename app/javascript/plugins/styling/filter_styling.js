export const filterStyling = () => {
  const filter = document.getElementById('job_query');
  const classes = filter.className.split(' ');
  const name = 'custom-select';

  if (filter) {
    console.log(true);
  }

  if (classes.indexOf(name) === -1) {
    filter.classList.add(name);
  }
};
