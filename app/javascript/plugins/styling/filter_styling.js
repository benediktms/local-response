export const filterStyling = () => {
  const filter = document.getElementById('job_query');
  const name = 'custom-select';

  if (filter) {
    const classes = filter.className.split(' ');
    console.log(true);
    if (classes.indexOf(name) === -1) {
      filter.classList.add(name);
    }
  }
};
