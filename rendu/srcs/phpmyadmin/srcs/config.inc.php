<?php

declare(strict_types=1);

/**                                                                                                                              
 * This is needed for cookie based authentication to encrypt password in                                                         
 * cookie. Needs to be 32 chars long.                                                                                            
 */
$cfg['blowfish_secret'] = ']77QaHe1,MZR48hfXqcz}Rls:L8b2IhK';

/* Servers configuration */
$i = 1;

/* Authentication type */
$cfg['Servers'][$i]['auth_type'] = 'cookie';
/* Server parameters */
$cfg['Servers'][$i]['host'] = 'mysql';
$cfg['Servers'][$i]['compress'] = false;
$cfg['Servers'][$i]['AllowNoPassword'] = true;

$cfg['Servers'][$i]['user'] = 'mysql';
$cfg['Servers'][$i]['password'] = '';

/* Directories for saving/loading files from server */
$cfg['UploadDir'] = '';
$cfg['SaveDir'] = '';
$cfg['PmaAbsoluteUri'] = './';
$cfg['TempDir'] = '/tmp';
