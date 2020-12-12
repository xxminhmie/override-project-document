import { Link, Typography } from '@material-ui/core';
import React from 'react'
import {Link as RouterLink}  from 'react-router-dom';

function Copyright() {
    return (
      <Typography variant="body2" color="textSecondary" align="center">
        {'Copyright © '}
        <Link component={RouterLink} color="inherit" to="https://www.facebook.com/tiktokLg/">
          TikTzuki
        </Link>{' '}
        {new Date().getFullYear()}
        {'.'}
      </Typography>
    );
  }
  
export default Copyright
